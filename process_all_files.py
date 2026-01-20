#!/usr/bin/env python3
import os
import sys
from pathlib import Path

UNUSED_CHIPSETS = [
    'CONFIG_RTL8188E', 'CONFIG_RTL8188E_SDIO',
    'CONFIG_RTL8812A', 'CONFIG_RTL8821A', 'CONFIG_RTL8192E',
    'CONFIG_RTL8821C', 'CONFIG_RTL8822B', 'CONFIG_RTL8822C',
    'CONFIG_RTL8188F', 'CONFIG_RTL8188GTV', 'CONFIG_RTL8192F',
    'CONFIG_RTL8703B', 'CONFIG_RTL8723B', 'CONFIG_RTL8814A',
    'CONFIG_RTL8710B', 'CONFIG_RTL8814B', 'CONFIG_RTL8723F',
]

def has_unused_chipset(line):
    for chipset in UNUSED_CHIPSETS:
        if chipset in line:
            return True
    return False

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
        
        # Simple case: standalone #ifdef for unused chipset
        if stripped.startswith(('#ifdef ', '#if defined(')) and has_unused_chipset(line):
            # Check if it's a simple OR condition that we should skip
            if ' || ' in line or '||' in line:
                # Contains OR - more complex, keep it for now
                result.append(line)
                i += 1
                continue
            
            # Simple standalone #ifdef - remove the whole block
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
                    if not has_unused_chipset(lines[i]):
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

# Get list of affected files
wifi_dir = Path('WIFI')
affected_files = [
    'include/hal_com.h', 'include/drv_types.h', 'include/rtw_pwrctrl.h',
    'include/drv_conf.h', 'os_dep/linux/os_intfs.c', 'include/hal_ic_cfg.h',
    'include/hal_com_h2c.h', 'include/hal_btcoex_wifionly.h',
    'include/rtw_recv.h', 'os_dep/linux/ioctl_linux.c',
    'os_dep/linux/custom_gpio_linux.c', 'os_dep/linux/rtw_proc.c',
    'core/rtw_xmit.c', 'os_dep/linux/recv_linux.c',
    'os_dep/linux/ioctl_mp.c', 'os_dep/linux/usb_ops_linux.c',
    'include/hal_data.h', 'include/rtw_mcc.h', 'include/rtw_efuse.h',
    'core/rtw_mp.c', 'core/rtw_bt_mp.c', 'include/rtw_mi.h',
    'core/rtw_debug.c', 'core/rtw_mlme.c', 'core/rtw_odm.c',
    'include/rtw_xmit.h', 'core/rtw_btcoex.c', 'hal/hal_mcc.c',
    'core/rtw_pwrctrl.c', 'core/rtw_rf.c', 'core/rtw_cmd.c',
    'hal/hal_mp.c', 'core/rtw_mlme_ext.c', 'hal/hal_intf.c',
    'hal/hal_com_phycfg.c', 'hal/hal_halmac.c',
]

total_removed = 0
for rel_path in affected_files:
    full_path = wifi_dir / rel_path
    if full_path.exists():
        removed = process_file(full_path)
        total_removed += removed

print(f"\nTotal lines removed: {total_removed}")
