#!/bin/bash

# DKMS status script for EW-7611ULB V2 Linux drivers
# Shows installation and runtime status of WiFi and Bluetooth drivers

echo "========================================="
echo "EW-7611ULB V2 Driver Status"
echo "========================================="

# Check if DKMS is installed
echo ""
echo "DKMS Installation:"
if command -v dkms &> /dev/null; then
    echo "  ✓ DKMS is installed ($(dkms --version 2>&1 | head -1))"
else
    echo "  ✗ DKMS is not installed"
    echo ""
    echo "Install DKMS:"
    echo "  Ubuntu/Debian: sudo apt-get install dkms"
    echo "  Fedora/RHEL:   sudo dnf install dkms"
    echo "  Arch Linux:    sudo pacman -S dkms"
    exit 1
fi

# Check DKMS status for both drivers
echo ""
echo "DKMS Driver Status:"
echo ""

# WiFi driver status
echo "WiFi Driver (rt8723du 5.6.1):"
if dkms status rt8723du/5.6.1 2>/dev/null | grep -q "installed"; then
    echo "  ✓ Installed in DKMS"
    dkms status rt8723du/5.6.1 | sed 's/^/    /'
else
    echo "  ✗ Not installed in DKMS"
fi

echo ""

# Bluetooth driver status
echo "Bluetooth USB Driver (edimax_btusb 3.1):"
if dkms status edimax_btusb/3.1 2>/dev/null | grep -q "installed"; then
    echo "  ✓ Installed in DKMS"
    dkms status edimax_btusb/3.1 | sed 's/^/    /'
else
    echo "  ✗ Not installed in DKMS"
fi

# Check loaded kernel modules
echo ""
echo "Loaded Kernel Modules:"
echo ""

echo "WiFi module (rt8723du):"
if lsmod | grep -q "^rt8723du"; then
    echo "  ✓ Loaded"
    lsmod | grep "^rt8723du" | sed 's/^/    /'
else
    echo "  ✗ Not loaded"
    echo "    Load with: sudo modprobe rt8723du"
fi

echo ""

echo "Bluetooth module (bt_edimax):"
if lsmod | grep -q "^bt_edimax"; then
    echo "  ✓ Loaded"
    lsmod | grep "^bt_edimax" | sed 's/^/    /'
else
    echo "  ✗ Not loaded"
    echo "    Load with: sudo modprobe bt_edimax"
fi

# Check for module files
echo ""
echo "Module Files:"
echo ""

# Find WiFi module
WIFI_MODULE=$(find /lib/modules/$(uname -r) -name "rt8723du.ko*" 2>/dev/null | head -1)
if [ -n "$WIFI_MODULE" ]; then
    echo "  ✓ rt8723du.ko found at: $WIFI_MODULE"
else
    echo "  ✗ rt8723du.ko not found"
fi

# Find Bluetooth module
BT_MODULE=$(find /lib/modules/$(uname -r) -name "bt_edimax.ko*" 2>/dev/null | head -1)
if [ -n "$BT_MODULE" ]; then
    echo "  ✓ bt_edimax.ko found at: $BT_MODULE"
else
    echo "  ✗ bt_edimax.ko not found"
fi

# Check firmware
echo ""
echo "Firmware Files:"
if [ -d "/lib/firmware/rtl_bt" ]; then
    echo "  ✓ Firmware directory exists: /lib/firmware/rtl_bt"
    FIRMWARE_COUNT=$(find /lib/firmware/rtl_bt -type f 2>/dev/null | wc -l)
    echo "    Files: $FIRMWARE_COUNT"
else
    echo "  ✗ Firmware directory not found: /lib/firmware/rtl_bt"
fi

# Show kernel version
echo ""
echo "System Information:"
echo "  Kernel: $(uname -r)"
echo "  Architecture: $(uname -m)"

echo ""
echo "========================================="
