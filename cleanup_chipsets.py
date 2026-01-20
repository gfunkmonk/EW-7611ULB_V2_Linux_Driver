#!/usr/bin/env python3
"""
Script to remove unused chipset #ifdef blocks from WIFI driver source.
Only keeps CONFIG_RTL8723D blocks.
"""

import re
import sys
from pathlib import Path

# Chipsets to remove (all except 8723D)
UNUSED_CHIPSETS = [
    'CONFIG_RTL8188E',
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
    'CONFIG_RTL8188E_SDIO',
]

def is_unused_chipset_line(line):
    """Check if line contains an unused chipset config."""
    for chipset in UNUSED_CHIPSETS:
        if chipset in line:
            return True
    return False

def should_keep_line(line):
    """Check if we should keep this line (not an unused chipset)."""
    # Keep CONFIG_RTL8723D
    if 'CONFIG_RTL8723D' in line:
        return True
    # Remove if contains unused chipset
    if is_unused_chipset_line(line):
        return False
    return True

def process_file(filepath):
    """Remove unused chipset blocks from a file."""
    print(f"Processing {filepath}...")
    
    with open(filepath, 'r', encoding='utf-8', errors='ignore') as f:
        lines = f.readlines()
    
    result = []
    skip_depth = 0
    i = 0
    
    while i < len(lines):
        line = lines[i]
        stripped = line.strip()
        
        # Check for #if/#ifdef with unused chipset
        if stripped.startswith(('#if ', '#ifdef ', '#elif ')):
            if is_unused_chipset_line(line):
                # Found unused chipset block - need to skip until matching #endif
                skip_depth = 1
                i += 1
                
                while i < len(lines) and skip_depth > 0:
                    inner_line = lines[i].strip()
                    
                    # Track nested #if/#ifdef
                    if inner_line.startswith(('#if ', '#ifdef ')):
                        skip_depth += 1
                    elif inner_line.startswith('#endif'):
                        skip_depth -= 1
                    elif inner_line.startswith('#elif') and skip_depth == 1:
                        # Check if #elif has unused chipset
                        if is_unused_chipset_line(lines[i]):
                            # Continue skipping
                            pass
                        else:
                            # This #elif is for something we keep
                            # Need to convert to #if
                            result.append(lines[i].replace('#elif', '#if', 1))
                            skip_depth = 0
                            i += 1
                            continue
                    elif inner_line.startswith('#else') and skip_depth == 1:
                        # The #else block should be kept, but without the #else
                        skip_depth = 0
                        i += 1
                        continue
                    
                    i += 1
                
                continue
        
        # Not in a skip block, keep the line
        result.append(line)
        i += 1
    
    # Write back
    with open(filepath, 'w', encoding='utf-8') as f:
        f.writelines(result)
    
    print(f"  Processed {filepath}")

def main():
    if len(sys.argv) > 1:
        filepath = Path(sys.argv[1])
        if filepath.exists():
            process_file(filepath)
        else:
            print(f"File not found: {filepath}")
    else:
        print("Usage: cleanup_chipsets.py <file>")

if __name__ == '__main__':
    main()
