#!/bin/bash
set -e

# DKMS removal script for EW-7611ULB V2 Linux drivers
# Removes both WiFi (edimax_wifi) and Bluetooth USB (edimax_bt) drivers

if [ "$EUID" -ne 0 ]; then
    echo "ERROR: This script must be run as root (use sudo)"
    exit 1
fi

# Check if DKMS is installed
if ! command -v dkms &> /dev/null; then
    echo "ERROR: DKMS is not installed."
    exit 1
fi

echo "========================================="
echo "Removing EW-7611ULB V2 Linux Drivers"
echo "========================================="

# Unload modules if loaded
echo ""
echo "Unloading kernel modules..."
rmmod edimax_wifi 2>/dev/null && echo "  ✓ Unloaded edimax_wifi" || echo "  - edimax_wifi not loaded"
rmmod edimax_bt 2>/dev/null && echo "  ✓ Unloaded edimax_bt" || echo "  - edimax_bt not loaded"

# Remove WiFi driver
echo ""
echo "Removing WiFi driver (edimax_wifi)..."
if dkms status edimax_wifi/5.6.1 &> /dev/null; then
    dkms remove edimax_wifi/5.6.1 --all
    echo "  ✓ Removed edimax_wifi from DKMS"
else
    echo "  - edimax_wifi not found in DKMS"
fi

# Remove source directory
if [ -d "/usr/src/edimax_wifi-5.6.1" ]; then
    rm -rf "/usr/src/edimax_wifi-5.6.1"
    echo "  ✓ Removed edimax_wifi source directory"
fi

# Remove Bluetooth USB driver
echo ""
echo "Removing Bluetooth USB driver (edimax_bt)..."
if dkms status edimax_bt/3.1 &> /dev/null; then
    dkms remove edimax_bt/3.1 --all
    echo "  ✓ Removed edimax_bt from DKMS"
else
    echo "  - edimax_bt not found in DKMS"
fi

# Remove source directory
if [ -d "/usr/src/edimax_bt-3.1" ]; then
    rm -rf "/usr/src/edimax_bt-3.1"
    echo "  ✓ Removed edimax_bt source directory"
fi

# Remove btusb blacklist
echo ""
echo "Removing btusb blacklist configuration..."
BLACKLIST_FILE="/etc/modprobe.d/btusb-blacklist.conf"
if [ -f "$BLACKLIST_FILE" ]; then
    rm "$BLACKLIST_FILE"
    echo "  ✓ Removed $BLACKLIST_FILE"
    echo "  ⚠ Reboot or run 'sudo modprobe btusb' to restore built-in driver"
else
    echo "  - Blacklist file not found"
fi

echo ""
echo "========================================="
echo "Removal completed successfully!"
echo "========================================="
echo ""
