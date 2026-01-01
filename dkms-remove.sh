#!/bin/bash
# DKMS removal script for EW-7611ULB V2 Linux Drivers
# This script removes WiFi and Bluetooth drivers from DKMS

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
    exit 1
fi

echo -e "${YELLOW}================================${NC}"
echo -e "${YELLOW}EW-7611ULB V2 DKMS Removal${NC}"
echo -e "${YELLOW}================================${NC}"
echo ""

# Function to remove a DKMS module
remove_dkms_module() {
    local module_name=$1
    local module_version=$2
    local dest_dir="/usr/src/${module_name}-${module_version}"
    
    echo -e "${YELLOW}Removing ${module_name} ${module_version}...${NC}"
    
    # Check if module exists in DKMS
    if dkms status "${module_name}/${module_version}" 2>/dev/null | grep -q "${module_name}"; then
        # Unload the module if loaded
        echo "Unloading module if loaded..."
        rmmod "${module_name}" 2>/dev/null || true
        
        # Remove from DKMS
        echo "Removing from DKMS..."
        dkms remove "${module_name}/${module_version}" --all
        
        # Remove source directory
        if [ -d "$dest_dir" ]; then
            echo "Removing source directory..."
            rm -rf "$dest_dir"
        fi
        
        echo -e "${GREEN}✓ ${module_name} removed successfully${NC}"
    else
        echo -e "${YELLOW}Module ${module_name} not found in DKMS, skipping...${NC}"
    fi
    echo ""
}

# Remove WiFi driver
echo -e "${YELLOW}[1/3] Removing WiFi Driver (8723du)${NC}"
remove_dkms_module "rtl8723du" "5.13.4"

# Remove Bluetooth USB driver
echo -e "${YELLOW}[2/3] Removing Bluetooth USB Driver (rtk_btusb)${NC}"
remove_dkms_module "rtk_btusb" "3.1"

# Remove Bluetooth UART driver
echo -e "${YELLOW}[3/3] Removing Bluetooth UART Driver (hci_uart)${NC}"
remove_dkms_module "rtk_hci_uart" "1.0"

echo -e "${GREEN}================================${NC}"
echo -e "${GREEN}Removal Complete!${NC}"
echo -e "${GREEN}================================${NC}"
echo ""
echo "All DKMS modules have been removed."
echo ""
