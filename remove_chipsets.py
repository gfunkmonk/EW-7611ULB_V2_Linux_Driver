#!/usr/bin/env python3
"""
Remove unused chipset #ifdef blocks from WIFI source code.
Keeps only CONFIG_RTL8723D blocks.
"""

import re
import sys
from pathlib import Path

# Chipsets to remove (all except 8723D)
UNUSED_CHIPSETS = [
    'CONFIG_RTL8188E',
    'CONFIG_RTL8188E_SDIO',
    'CONFIG_RTL8812A',
    'CONFIG_RTL8821A',
    'CONFIG_RTL8192E',
    'CONFIG_RTL8821C',
    'CONFIG_RTL8822B',
    'CONFIG_RTL8822C',
    'CONFIG_RTL8188F',
    'CONFIG_RTL8188GTV',
    'CONFIG_RTL8192F',
    'CONFIG_RTL8703B',
    'CONFIG_RTL8723B',
    'CONFIG_RTL8814A',
    'CONFIG_RTL8710B',
    'CONFIG_RTL8814B',
    'CONFIG_RTL8723F',
]

def has_unused_chipset(line):
    """Check if a line references an unused chipset."""
    for chipset in UNUSED_CHIPSETS:
        if chipset in line:
            return True
    return False

def process_file(filepath):
    """Remove unused chipset #ifdef blocks from a file."""
    print(f"Processing {filepath}...")
    
    try:
        with open(filepath, 'r', encoding='utf-8', errors='ignore') as f:
            lines = f.readlines()
    except Exception as e:
        print(f"Error reading {filepath}: {e}")
        return
    
    result = []
    i = 0
    lines_removed = 0
    
    while i < len(lines):
        line = lines[i]
        stripped = line.strip()
        
        # Check for preprocessor directives with unused chipsets
        if stripped.startswith('#if'):
            # Check if this is an unused chipset block
            if has_unused_chipset(line):
                # Skip this entire block
                start_i = i
                depth = 1
                i += 1
                
                while i < len(lines) and depth > 0:
                    inner = lines[i].strip()
                    
                    if inner.startswith('#if'):
                        depth += 1
                    elif inner == '#endif':
                        depth -= 1
                        if depth == 0:
                            i += 1  # Skip the #endif too
                    elif inner.startswith('#elif') and depth == 1:
                        # Check if elif also has unused chipset
                        if not has_unused_chipset(lines[i]):
                            # This elif should be kept, convert to #if
                            result.append(lines[i].replace('#elif', '#if', 1))
                            depth = 0
                            i += 1
                            break
                        # else continue skipping
                    elif inner.startswith('#else') and depth == 1:
                        # Keep the else content but not the else directive
                        depth = 0
                        i += 1
                        break
                    
                    i += 1
                
                lines_removed += (i - start_i)
                continue
        
        # Keep this line
        result.append(line)
        i += 1
    
    # Write back if changes were made
    if lines_removed > 0:
        try:
            with open(filepath, 'w', encoding='utf-8') as f:
                f.writelines(result)
            print(f"  Removed {lines_removed} lines from {filepath}")
        except Exception as e:
            print(f"Error writing {filepath}: {e}")
    else:
        print(f"  No changes needed for {filepath}")

def main():
    if len(sys.argv) > 1:
        filepath = Path(sys.argv[1])
        if filepath.exists():
            process_file(filepath)
        else:
            print(f"File not found: {filepath}")
            sys.exit(1)
    else:
        print("Usage: remove_chipsets.py <file>")
        sys.exit(1)

if __name__ == '__main__':
    main()
