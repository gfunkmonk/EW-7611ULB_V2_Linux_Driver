# EW-7611ULB_V2_Linux_Driver

Linux drivers for the EW-7611ULB V2 WiFi/Bluetooth USB adapter.

This driver package includes:
- **WiFi**: Realtek RTL8723DU wireless network driver
- **Bluetooth USB**: Realtek Bluetooth USB driver (rtk_btusb)
- **Bluetooth UART**: Realtek Bluetooth UART driver (hci_uart)

## Quick Start with DKMS

```bash
# Install prerequisites
sudo apt-get install dkms build-essential git  # Ubuntu/Debian

# Clone and install
git clone https://github.com/gfunkmonk/EW-7611ULB_V2_Linux_Driver.git
cd EW-7611ULB_V2_Linux_Driver
sudo ./dkms-install.sh

# Load modules
sudo modprobe 8723du
sudo modprobe rtk_btusb

# Check status
./dkms-status.sh
```

## Installation Methods

### Method 1: DKMS Installation (Recommended)

DKMS (Dynamic Kernel Module Support) automatically rebuilds the drivers when you update your kernel, making it the preferred installation method.

#### Prerequisites

First, install DKMS on your system:

```bash
# Ubuntu/Debian
sudo apt-get install dkms build-essential git

# Fedora/RHEL/CentOS
sudo dnf install dkms kernel-devel git

# Arch Linux
sudo pacman -S dkms linux-headers git
```

#### Install Drivers

```bash
# Clone the repository
git clone https://github.com/gfunkmonk/EW-7611ULB_V2_Linux_Driver.git
cd EW-7611ULB_V2_Linux_Driver

# Run the DKMS installation script
sudo ./dkms-install.sh
```

The script will:
1. Install the WiFi driver (rtl8723du)
2. Install the Bluetooth USB driver (rtk_btusb)
3. Install the Bluetooth UART driver (hci_uart)
4. Copy firmware files to `/lib/firmware`
5. Build and install the `rtk_hciattach` utility

After installation, you may need to load the modules:

```bash
sudo modprobe 8723du
sudo modprobe rtk_btusb
```

#### Check Installation Status

To verify the installation and check driver status:

```bash
./dkms-status.sh
```

This script will show you:
- Whether DKMS is installed
- Status of all driver modules in DKMS
- Which kernel modules are currently loaded
- Firmware file locations
- Installed utilities

#### Uninstall Drivers

To remove the DKMS drivers:

```bash
sudo ./dkms-remove.sh
```

### Method 2: Manual Installation (Legacy)

If you prefer not to use DKMS, you can still manually build and install the drivers.

#### WiFi Driver

```bash
cd WIFI
make
sudo make install
sudo modprobe 8723du
```

#### Bluetooth USB Driver

```bash
cd BT/Linux
sudo make install INTERFACE=usb
```

#### Bluetooth UART Driver

```bash
cd BT/Linux
sudo make install INTERFACE=uart
```

#### Install Both Bluetooth Drivers

```bash
cd BT/Linux
sudo make install INTERFACE=all
```

## Module Information

### WiFi Module (8723du)
- **Chip**: Realtek RTL8723DU
- **Module name**: 8723du.ko
- **Interface**: USB
- **Features**: 802.11n, AP mode, P2P, Monitor mode

### Bluetooth USB Module (rtk_btusb)
- **Module name**: rtk_btusb.ko
- **Interface**: USB
- **Replaces**: Standard btusb module for Realtek devices

### Bluetooth UART Module (hci_uart)
- **Module name**: hci_uart.ko
- **Interface**: UART/Serial
- **Utility**: rtk_hciattach (for UART initialization)

## Troubleshooting

### WiFi not working
```bash
# Check if module is loaded
lsmod | grep 8723du

# Check kernel messages
dmesg | grep -i rtl

# Reload the module
sudo modprobe -r 8723du
sudo modprobe 8723du
```

### Bluetooth not working
```bash
# Check if module is loaded
lsmod | grep -E "(rtk_btusb|hci_uart)"

# Check Bluetooth service
sudo systemctl status bluetooth

# Restart Bluetooth
sudo systemctl restart bluetooth
```

### DKMS build failures
```bash
# Check DKMS status
dkms status

# View build logs
cat /var/lib/dkms/rtl8723du/5.6.1/build/make.log
cat /var/lib/dkms/rtk_btusb/3.1/build/make.log
cat /var/lib/dkms/hci_uart/3.1/build/make.log
```

### Build error: "generated/autoconf.h: No such file or directory"

This error occurs when kernel headers are incomplete or not properly prepared. The driver now includes automatic detection and preparation of kernel headers, but if you encounter this issue:

**Automatic Fix (Recommended):**
The Makefile will automatically attempt to prepare kernel headers. Just run:
```bash
cd WIFI
make
```

**Manual Fix:**
If the automatic preparation fails, you may need to:

1. **Ensure kernel headers are fully installed:**
   ```bash
   # Debian/Ubuntu
   sudo apt-get install --reinstall linux-headers-$(uname -r)
   
   # Fedora/RHEL/CentOS
   sudo dnf reinstall kernel-devel-$(uname -r)
   # Or if the exact version is not available:
   # sudo dnf install kernel-devel
   
   # Arch Linux
   sudo pacman -S linux-headers
   ```

2. **For custom kernels:** If you're using a custom kernel, prepare the headers manually:
   ```bash
   cd /lib/modules/$(uname -r)/build
   sudo make modules_prepare
   ```

3. **For incomplete header packages:** Some distributions provide minimal header packages. You may need the full kernel source:
   ```bash
   # Download and prepare full kernel source matching your version
   # Then set KSRC to point to it when building:
   cd WIFI
   make KSRC=/path/to/kernel/source
   ```

## Supported Kernels

These drivers support Linux kernels 3.x through 6.x. The DKMS installation method ensures compatibility across kernel updates.

## License

Please refer to the individual source files for license information.
