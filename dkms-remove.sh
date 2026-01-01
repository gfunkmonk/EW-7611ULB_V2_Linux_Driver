#!/bin/bash
# DKMS removal script for EW-7611ULB V2 Linux Driver

set -e

# Check if running as root
if [ "$EUID" -ne 0 ]; then 
    echo "Please run as root (use sudo)"
    exit 1
fi

# Check if DKMS is installed
if ! command -v dkms &> /dev/null; then
    echo "DKMS is not installed."
    exit 1
fi

echo "Removing EW-7611ULB V2 drivers from DKMS..."

# Remove WiFi driver
echo ""
echo "=== Removing WiFi driver (RTL8723DU) ==="
dkms remove -m rtl8723du -v 5.6.1 --all || echo "WiFi driver not found in DKMS"
rm -rf "/usr/src/rtl8723du-5.6.1"

# Remove Bluetooth USB driver
echo ""
echo "=== Removing Bluetooth USB driver ==="
dkms remove -m rtk_btusb -v 3.1 --all || echo "Bluetooth USB driver not found in DKMS"
rm -rf "/usr/src/rtk_btusb-3.1"

# Remove Bluetooth UART driver
echo ""
echo "=== Removing Bluetooth UART driver ==="
dkms remove -m hci_uart -v 3.1 --all || echo "Bluetooth UART driver not found in DKMS"
rm -rf "/usr/src/hci_uart-3.1"

# Remove rtk_hciattach utility
echo ""
echo "=== Removing rtk_hciattach utility ==="
rm -f /usr/sbin/rtk_hciattach

echo ""
echo "=== Removal complete ==="
echo ""
echo "Note: Firmware files in /lib/firmware were not removed."
echo "To remove them manually:"
echo "  sudo rm -f /lib/firmware/rtl*_fw /lib/firmware/rtl*_config"
echo "  sudo rm -rf /lib/firmware/rtlbt"
echo ""
