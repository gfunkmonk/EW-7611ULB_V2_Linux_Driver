#!/usr/bin/env python3
import re
from pathlib import Path

UNUSED_CHIPSETS = [
    'CONFIG_RTL8188E', 'CONFIG_RTL8188E_SDIO',
    'CONFIG_RTL8812A', 'CONFIG_RTL8821A', 'CONFIG_RTL8192E',
    'CONFIG_RTL8821C', 'CONFIG_RTL8822B', 'CONFIG_RTL8822C',
    'CONFIG_RTL8188F', 'CONFIG_RTL8188GTV', 'CONFIG_RTL8192F',
    'CONFIG_RTL8703B', 'CONFIG_RTL8723B', 'CONFIG_RTL8814A',
    'CONFIG_RTL8710B', 'CONFIG_RTL8814B', 'CONFIG_RTL8723F',
]

def extract_config_names(line):
    return re.findall(r'CONFIG_RTL\w+', line)

def all_configs_unused(configs):
    for config in configs:
        if config not in UNUSED_CHIPSETS and config != 'CONFIG_RTL8723D':
            return False
    return True

def has_8723d(configs):
    return 'CONFIG_RTL8723D' in configs

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
        
        if stripped.startswith(('#if ', '#ifdef ', '#elif ')):
            configs = extract_config_names(line)
            
            if configs and all_configs_unused(configs) and not has_8723d(configs):
                start_i = i
                depth = 1
                i += 1
                
                while i < len(lines) and depth > 0:
                    inner = lines[i].strip()
                    if inner.startswith(('#ifdef ', '#if ')):
                        depth += 1
                    elif inner == '#endif' or inner.startswith('#endif '):
                        depth -= 1
                    elif inner.startswith('#elif') and depth == 1:
                        elif_configs = extract_config_names(lines[i])
                        if elif_configs and not all_configs_unused(elif_configs):
                            result.append(lines[i].replace('#elif', '#if', 1))
                            depth = 0
                            i += 1
                            break
                    elif inner.startswith('#else') and depth == 1:
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
    'WIFI/hal/hal_hci/hal_usb.c',
    'WIFI/hal/phydm/halrf/halrf_powertracking_ap.c',
    'WIFI/hal/phydm/halrf/halrf_powertracking_win.c',
    'WIFI/include/gspi_hal.h',
    'WIFI/include/rtw_odm.h',
    'WIFI/include/hal_com_reg.h',
    'WIFI/include/pci_hal.h',
    'WIFI/include/hal_intf.h',
    'WIFI/include/sdio_hal.h',
    'WIFI/include/gspi_ops.h',
    'WIFI/include/sdio_ops.h',
    'WIFI/include/pci_ops.h',
    'WIFI/include/usb_hal.h',
]

total = 0
for filepath in files:
    if Path(filepath).exists():
        total += process_file(filepath)

print(f"\nTotal removed: {total}")
