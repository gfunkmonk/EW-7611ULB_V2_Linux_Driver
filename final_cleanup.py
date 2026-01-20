#!/usr/bin/env python3
import re
import sys
from pathlib import Path

UNUSED_CHIPSETS = set([
    'CONFIG_RTL8188E', 'CONFIG_RTL8188E_SDIO',
    'CONFIG_RTL8812A', 'CONFIG_RTL8821A', 'CONFIG_RTL8192E',
    'CONFIG_RTL8821C', 'CONFIG_RTL8822B', 'CONFIG_RTL8822C',
    'CONFIG_RTL8188F', 'CONFIG_RTL8188GTV', 'CONFIG_RTL8192F',
    'CONFIG_RTL8703B', 'CONFIG_RTL8723B', 'CONFIG_RTL8814A',
    'CONFIG_RTL8710B', 'CONFIG_RTL8814B', 'CONFIG_RTL8723F',
])

def extract_configs(line):
    """Extract all CONFIG_RTL* from line."""
    return set(re.findall(r'CONFIG_RTL\w+', line))

def should_remove_block(line):
    """Check if this #if block should be removed."""
    configs = extract_configs(line)
    if not configs:
        return False
    
    # If has 8723D, don't remove
    if 'CONFIG_RTL8723D' in configs:
        return False
    
    # If all configs are unused, remove
    return configs.issubset(UNUSED_CHIPSETS)

def process_file(filepath):
    try:
        with open(filepath, 'r', encoding='utf-8', errors='ignore') as f:
            lines = f.readlines()
    except:
        return 0
    
    result = []
    i = 0
    removed = 0
    
    while i < len(lines):
        line = lines[i]
        stripped = line.strip()
        
        if stripped.startswith(('#if ', '#ifdef ', '#elif ', '#ifndef ')):
            if should_remove_block(line):
                # Remove this block
                start_i = i
                depth = 1
                i += 1
                
                while i < len(lines) and depth > 0:
                    inner = lines[i].strip()
                    
                    if inner.startswith(('#ifdef ', '#if ', '#ifndef ')):
                        depth += 1
                    elif inner == '#endif' or inner.startswith('#endif '):
                        depth -= 1
                    elif inner.startswith('#elif') and depth == 1:
                        if not should_remove_block(lines[i]):
                            # Keep this elif by converting to #if
                            result.append(lines[i].replace('#elif', '#if', 1))
                            depth = 0
                            i += 1
                            break
                    elif inner.startswith('#else') and depth == 1:
                        # Keep the else content
                        depth = 0
                        i += 1
                        break
                    
                    i += 1
                
                removed += (i - start_i)
                continue
        
        result.append(line)
        i += 1
    
    if removed > 0:
        with open(filepath, 'w', encoding='utf-8') as f:
            f.writelines(result)
        print(f"{filepath}: removed {removed} lines")
        return removed
    return 0

files = [
    'WIFI/hal/hal_mp.c',
    'WIFI/core/rtw_mp.c',
    'WIFI/core/rtw_pwrctrl.c',
    'WIFI/core/rtw_debug.c',
    'WIFI/include/hal_data.h',
    'WIFI/include/drv_conf.h',
    'WIFI/core/rtw_rf.c',
    'WIFI/platform/platform_ARM_SUNxI_usb.c',
    'WIFI/os_dep/linux/custom_gpio_linux.c',
    'WIFI/os_dep/linux/recv_linux.c',
    'WIFI/os_dep/linux/ioctl_mp.c',
    'WIFI/os_dep/linux/usb_ops_linux.c',
    'WIFI/os_dep/linux/os_intfs.c',
    'WIFI/include/rtw_recv.h',
    'WIFI/hal/hal_com_phycfg.c',
    'WIFI/platform/platform_sprd_sdio.c',
    'WIFI/include/hal_ic_cfg.h',
    'WIFI/include/hal_btcoex_wifionly.h',
    'WIFI/hal/phydm/halrf/halrf_powertracking_ap.c',
]

total = 0
for fp in files:
    if Path(fp).exists():
        total += process_file(fp)

print(f"\nTotal removed: {total}")
