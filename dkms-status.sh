#!/bin/bash
# DKMS status check script for EW-7611ULB V2 Linux Driver

echo "=== EW-7611ULB V2 Driver Status ==="
echo ""

# Check DKMS installation
if ! command -v dkms &> /dev/null; then
    echo "❌ DKMS is not installed"
else
    echo "✓ DKMS is installed"
fi

echo ""
echo "=== DKMS Modules Status ==="

# Check WiFi driver
if dkms status rtl8723du 2>/dev/null | grep -q "installed"; then
    echo "✓ WiFi driver (rtl8723du) is installed via DKMS"
    dkms status rtl8723du 2>/dev/null | sed 's/^/  /'
else
    echo "❌ WiFi driver (rtl8723du) is NOT installed via DKMS"
fi

# Check Bluetooth USB driver
if dkms status rtk_btusb 2>/dev/null | grep -q "installed"; then
    echo "✓ Bluetooth USB driver (rtk_btusb) is installed via DKMS"
    dkms status rtk_btusb 2>/dev/null | sed 's/^/  /'
else
    echo "❌ Bluetooth USB driver (rtk_btusb) is NOT installed via DKMS"
fi

echo ""
echo "=== Loaded Kernel Modules ==="

# Check if WiFi module is loaded
if lsmod | grep -q "rt8723du"; then
    echo "✓ WiFi module (rt8723du) is loaded"
else
    echo "  WiFi module (rt8723du) is not loaded (run: sudo modprobe rt8723du)"
fi

# Check if Bluetooth USB module is loaded
if lsmod | grep -q "bt_edimax"; then
    echo "✓ Bluetooth USB module (bt_edimax) is loaded"
else
    echo "  Bluetooth USB module (bt_edimax) is not loaded (run: sudo modprobe bt_edimax)"
fi

echo ""
echo "=== Firmware Files ==="

# Check WiFi firmware
if ls /lib/firmware/rtl*_fw 2>/dev/null | grep -q .; then
    echo "✓ WiFi firmware files found:"
    ls -1 /lib/firmware/rtl*_fw 2>/dev/null | sed 's/^/  /'
else
    echo "❌ WiFi firmware files not found in /lib/firmware/"
fi

# Check Bluetooth firmware
if ls /lib/firmware/rtl*_fw 2>/dev/null | grep -q .; then
    echo "✓ Bluetooth firmware files found:"
    ls -1 /lib/firmware/rtl*_fw 2>/dev/null | sed 's/^/  /'
else
    echo "  Bluetooth firmware files not found in /lib/firmware/"
fi

echo ""
echo "=== Network Interfaces ==="

# Check for WiFi interface
if ip link show 2>/dev/null | grep -q "wlan"; then
    echo "✓ WiFi interface detected:"
    ip link show 2>/dev/null | grep -A1 "wlan" | sed 's/^/  /'
else
    echo "  No WiFi interface detected"
fi

echo ""
