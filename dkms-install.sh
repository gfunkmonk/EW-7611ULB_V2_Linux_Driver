#!/bin/bash
set -e

# DKMS installation script for EW-7611ULB V2 Linux drivers
# Installs both WiFi (edimax_wifi) and Bluetooth USB (edimax_bt) drivers

if [ "$EUID" -ne 0 ]; then
    echo "ERROR: This script must be run as root (use sudo)"
    exit 1
fi

# Check if DKMS is installed
if ! command -v dkms &> /dev/null; then
    echo "ERROR: DKMS is not installed."
    echo "Please install DKMS first:"
    echo "  Ubuntu/Debian: sudo apt-get install dkms"
    echo "  Fedora/RHEL:   sudo dnf install dkms"
    echo "  Arch Linux:    sudo pacman -S dkms"
    exit 1
fi

echo "========================================="
echo "Installing EW-7611ULB V2 Linux Drivers"
echo "========================================="

# Get the absolute path to the repository
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# WiFi driver installation
echo ""
echo "Installing WiFi driver (edimax_wifi)..."
WIFI_SRC="$REPO_DIR/WIFI"
WIFI_DEST="/usr/src/edimax_wifi-5.6.1"

# Remove old version if it exists
if dkms status edimax_wifi/5.6.1 &> /dev/null; then
    echo "  Removing old edimax_wifi driver..."
    dkms remove edimax_wifi/5.6.1 --all 2>/dev/null || true
fi

# Copy source to /usr/src
if [ -d "$WIFI_DEST" ]; then
    rm -rf "$WIFI_DEST"
fi
cp -r "$WIFI_SRC" "$WIFI_DEST"

# Add, build, and install with DKMS
echo "  Adding to DKMS..."
dkms add -m edimax_wifi -v 5.6.1

echo "  Building module..."
dkms build -m edimax_wifi -v 5.6.1

echo "  Installing module..."
dkms install -m edimax_wifi -v 5.6.1

echo "  ✓ WiFi driver installed successfully"

# Bluetooth USB driver installation
echo ""
echo "Installing Bluetooth USB driver (edimax_bt)..."
BT_SRC="$REPO_DIR/BT/usb"
BT_DEST="/usr/src/edimax_bt-3.1"

# Remove old version if it exists
if dkms status edimax_bt/3.1 &> /dev/null; then
    echo "  Removing old edimax_bt driver..."
    dkms remove edimax_bt/3.1 --all 2>/dev/null || true
fi

# Copy source to /usr/src
if [ -d "$BT_DEST" ]; then
    rm -rf "$BT_DEST"
fi
cp -r "$BT_SRC" "$BT_DEST"

# Add, build, and install with DKMS
echo "  Adding to DKMS..."
dkms add -m edimax_bt -v 3.1

echo "  Building module..."
dkms build -m edimax_bt -v 3.1

echo "  Installing module..."
dkms install -m edimax_bt -v 3.1

echo "  ✓ Bluetooth USB driver installed successfully"

# Copy firmware files
echo ""
echo "Installing firmware files..."
FIRMWARE_SRC="$REPO_DIR/BT/rtkbt-firmware"
FIRMWARE_DEST="/lib/firmware/rtl_bt"

if [ -d "$FIRMWARE_SRC" ]; then
    mkdir -p "$FIRMWARE_DEST"
    cp -r "$FIRMWARE_SRC"/* "$FIRMWARE_DEST/" 2>/dev/null || true
    echo "  ✓ Firmware files installed to $FIRMWARE_DEST"
fi

# Blacklist built-in btusb driver to allow edimax_bt to load
echo ""
echo "Blacklisting built-in btusb driver..."
BLACKLIST_SRC="$REPO_DIR/BT/usb/btusb-blacklist.conf"
BLACKLIST_DEST="/etc/modprobe.d/btusb-blacklist.conf"

if [ -f "$BLACKLIST_SRC" ]; then
    cp "$BLACKLIST_SRC" "$BLACKLIST_DEST"
    echo "  ✓ Blacklist configuration installed to $BLACKLIST_DEST"
    echo "  ⚠ You must reboot or run 'sudo rmmod btusb' for this to take effect"
fi

echo ""
echo "========================================="
echo "Installation completed successfully!"
echo "========================================="
echo ""
echo "IMPORTANT: To use the Bluetooth driver, you must either:"
echo "  1. Reboot your system, OR"
echo "  2. Unload the built-in btusb driver: sudo rmmod btusb"
echo ""
echo "Then load the modules:"
echo "  sudo modprobe edimax_wifi"
echo "  sudo modprobe edimax_bt"
echo ""
echo "Check installation status with:"
echo "  ./dkms-status.sh"
echo ""
