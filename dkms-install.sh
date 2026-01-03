#!/bin/bash
# DKMS installation script for EW-7611ULB V2 Linux Driver

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DRIVER_NAME="ew-7611ulb-v2"
DRIVER_VERSION="1.0"

# Check if running as root
if [ "$EUID" -ne 0 ]; then 
    echo "Please run as root (use sudo)"
    exit 1
fi

# Check if DKMS is installed
if ! command -v dkms &> /dev/null; then
    echo "DKMS is not installed. Please install it first:"
    echo "  Ubuntu/Debian: sudo apt-get install dkms"
    echo "  Fedora/RHEL:   sudo dnf install dkms"
    echo "  Arch Linux:    sudo pacman -S dkms"
    exit 1
fi

echo "Installing EW-7611ULB V2 drivers using DKMS..."

# Create DKMS source directory
DKMS_ROOT="/usr/src"
WIFI_DIR="${DKMS_ROOT}/rtl8723du-5.6.1"
BT_USB_DIR="${DKMS_ROOT}/rtk_btusb-3.1"

# Install WiFi driver
echo ""
echo "=== Installing WiFi driver (RTL8723DU) ==="
rm -rf "${WIFI_DIR}"
mkdir -p "${WIFI_DIR}"
cp -r "${SCRIPT_DIR}/WIFI"/* "${WIFI_DIR}/"
dkms add -m rtl8723du -v 5.6.1 || true
dkms build -m rtl8723du -v 5.6.1
dkms install -m rtl8723du -v 5.6.1

# Install Bluetooth USB driver
echo ""
echo "=== Installing Bluetooth USB driver ==="
rm -rf "${BT_USB_DIR}"
mkdir -p "${BT_USB_DIR}"
cp -r "${SCRIPT_DIR}/BT/Linux/usb"/* "${BT_USB_DIR}/"
dkms add -m rtk_btusb -v 3.1 || true
dkms build -m rtk_btusb -v 3.1
dkms install -m rtk_btusb -v 3.1

# Install firmware
echo ""
echo "=== Installing firmware files ==="
FIRMWARE_SRC="${SCRIPT_DIR}/BT/Linux/rtkbt-firmware/lib/firmware"
FIRMWARE_DEST="/lib/firmware"

# Install firmware for USB
if [ -d "${FIRMWARE_SRC}" ]; then
    mkdir -p "${FIRMWARE_DEST}"
    # Copy firmware files with explicit check
    for fw_file in "${FIRMWARE_SRC}"/rtl*_fw; do
        [ -e "$fw_file" ] && cp -f "$fw_file" "${FIRMWARE_DEST}/"
    done
    for cfg_file in "${FIRMWARE_SRC}"/rtl*_config; do
        [ -e "$cfg_file" ] && cp -f "$cfg_file" "${FIRMWARE_DEST}/"
    done
fi

echo ""
echo "=== Installation complete ==="
echo ""
echo "Installed modules:"
dkms status | grep -E "(rtl8723du|rtk_btusb)" || true
echo ""
echo "You may need to reboot or reload the modules:"
echo "  sudo modprobe rt8723du"
echo "  sudo modprobe bt_edimax"
echo ""
