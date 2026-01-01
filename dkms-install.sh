#!/bin/bash
# DKMS installation script for EW-7611ULB V2 Linux Drivers
# This script installs WiFi and Bluetooth drivers using DKMS

set -e

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Check if running as root
if [[ $EUID -ne 0 ]]; then
   echo -e "${RED}Error: This script must be run as root${NC}" 
   echo "Please run: sudo $0"
   exit 1
fi

# Check if DKMS is installed
if ! command -v dkms &> /dev/null; then
    echo -e "${RED}Error: DKMS is not installed${NC}"
    echo ""
    echo "Please install DKMS first:"
    echo "  Ubuntu/Debian: sudo apt-get install dkms"
    echo "  Fedora/RHEL:   sudo dnf install dkms"
    echo "  Arch Linux:    sudo pacman -S dkms"
    echo ""
    exit 1
fi

# Get the absolute path of the script directory
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo -e "${GREEN}================================${NC}"
echo -e "${GREEN}EW-7611ULB V2 DKMS Installation${NC}"
echo -e "${GREEN}================================${NC}"
echo ""

# Function to install a DKMS module
install_dkms_module() {
    local module_name=$1
    local module_version=$2
    local source_dir=$3
    local dest_dir="/usr/src/${module_name}-${module_version}"
    
    echo -e "${YELLOW}Installing ${module_name} ${module_version}...${NC}"
    
    # Remove old version if exists
    if dkms status "${module_name}/${module_version}" 2>/dev/null | grep -q "${module_name}"; then
        echo "Removing existing DKMS module..."
        dkms remove "${module_name}/${module_version}" --all 2>/dev/null || true
    fi
    
    # Remove old source directory if exists
    if [ -d "$dest_dir" ]; then
        echo "Removing old source directory..."
        rm -rf "$dest_dir"
    fi
    
    # Copy source files to /usr/src
    echo "Copying source files to $dest_dir..."
    mkdir -p "$dest_dir"
    cp -r "$source_dir"/* "$dest_dir/"
    
    # Add to DKMS
    echo "Adding module to DKMS..."
    dkms add -m "${module_name}" -v "${module_version}"
    
    # Build the module
    echo "Building module..."
    dkms build -m "${module_name}" -v "${module_version}"
    
    # Install the module
    echo "Installing module..."
    dkms install -m "${module_name}" -v "${module_version}"
    
    echo -e "${GREEN}✓ ${module_name} installed successfully${NC}"
    echo ""
}

# Install WiFi driver
echo -e "${YELLOW}[1/3] WiFi Driver (8723du)${NC}"
install_dkms_module "rtl8723du" "5.13.4" "${SCRIPT_DIR}/WIFI"

# Install Bluetooth USB driver
echo -e "${YELLOW}[2/3] Bluetooth USB Driver (rtk_btusb)${NC}"
install_dkms_module "rtk_btusb" "3.1" "${SCRIPT_DIR}/BT/Linux/usb/bluetooth_usb_driver"

# Install Bluetooth UART driver
echo -e "${YELLOW}[3/3] Bluetooth UART Driver (hci_uart)${NC}"
install_dkms_module "rtk_hci_uart" "1.0" "${SCRIPT_DIR}/BT/Linux/uart/bluetooth_uart_driver"

echo -e "${GREEN}================================${NC}"
echo -e "${GREEN}Installation Complete!${NC}"
echo -e "${GREEN}================================${NC}"
echo ""
echo "The following modules have been installed:"
echo "  • rtl8723du (WiFi)"
echo "  • rtk_btusb (Bluetooth USB)"
echo "  • rtk_hci_uart (Bluetooth UART)"
echo ""
echo "These modules will be automatically rebuilt when you update your kernel."
echo ""
echo "To load the WiFi module:"
echo "  sudo modprobe 8723du"
echo ""
echo "To load the Bluetooth USB module:"
echo "  sudo modprobe rtk_btusb"
echo ""
echo -e "${YELLOW}Note: You may need to reboot for changes to take effect.${NC}"
echo ""
