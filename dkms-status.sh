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
echo "WiFi Driver (edimax_wifi 5.6.1):"
if dkms status edimax_wifi/5.6.1 2>/dev/null | grep -q "installed"; then
    echo "  ✓ Installed in DKMS"
    dkms status edimax_wifi/5.6.1 | sed 's/^/    /'
else
    echo "  ✗ Not installed in DKMS"
fi

echo ""

# Bluetooth driver status
echo "Bluetooth USB Driver (edimax_bt 3.1):"
if dkms status edimax_bt/3.1 2>/dev/null | grep -q "installed"; then
    echo "  ✓ Installed in DKMS"
    dkms status edimax_bt/3.1 | sed 's/^/    /'
else
    echo "  ✗ Not installed in DKMS"
fi

# Check loaded kernel modules
echo ""
echo "Loaded Kernel Modules:"
echo ""

echo "WiFi module (edimax_wifi):"
if lsmod | grep -q "^edimax_wifi"; then
    echo "  ✓ Loaded"
    lsmod | grep "^edimax_wifi" | sed 's/^/    /'
else
    echo "  ✗ Not loaded"
    echo "    Load with: sudo modprobe edimax_wifi"
fi

echo ""

echo "Bluetooth module (edimax_bt):"
if lsmod | grep -q "^edimax_bt"; then
    echo "  ✓ Loaded"
    lsmod | grep "^edimax_bt" | sed 's/^/    /'
else
    echo "  ✗ Not loaded"
    echo "    Load with: sudo modprobe edimax_bt"
fi

# Check for module files
echo ""
echo "Module Files:"
echo ""

# Find WiFi module
WIFI_MODULE=$(find /lib/modules/$(uname -r) -name "edimax_wifi.ko*" 2>/dev/null | head -1)
if [ -n "$WIFI_MODULE" ]; then
    echo "  ✓ edimax_wifi.ko found at: $WIFI_MODULE"
else
    echo "  ✗ edimax_wifi.ko not found"
fi

# Find Bluetooth module
BT_MODULE=$(find /lib/modules/$(uname -r) -name "edimax_bt.ko*" 2>/dev/null | head -1)
if [ -n "$BT_MODULE" ]; then
    echo "  ✓ edimax_bt.ko found at: $BT_MODULE"
else
    echo "  ✗ edimax_bt.ko not found"
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
