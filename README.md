# EW-7611ULB_V2_Linux_Driver

Linux drivers for the EW-7611ULB V2 WiFi/Bluetooth USB adapter.

This driver package includes:
- **WiFi**: Realtek RTL8723DU wireless network driver
- **Bluetooth USB**: Realtek Bluetooth USB driver (edimax_bt)

## Quick Start with DKMS

```bash
# Install prerequisites
sudo apt-get install dkms build-essential git  # Ubuntu/Debian

# Clone and install
git clone https://github.com/gfunkmonk/EW-7611ULB_V2_Linux_Driver.git
cd EW-7611ULB_V2_Linux_Driver
sudo ./dkms-install.sh

# Load modules
sudo modprobe rt8723du
sudo modprobe edimax_bt

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
2. Install the Bluetooth USB driver (edimax_bt)
3. Copy firmware files to `/lib/firmware`
4. Blacklist the built-in btusb driver

After installation, you must either reboot or unload btusb:

```bash
# Either reboot, OR:
sudo rmmod btusb

# Then load the modules
sudo modprobe rt8723du
sudo modprobe edimax_bt
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
sudo modprobe rt8723du
```

#### Bluetooth USB Driver

```bash
cd BT/Linux
sudo make install
```

## Module Information

### WiFi Module (rt8723du)
- **Chip**: Realtek RTL8723DU
- **Module name**: rt8723du.ko
- **Interface**: USB
- **Features**: 802.11n, AP mode, P2P, Monitor mode

### Bluetooth USB Module (edimax_bt)
- **Module name**: edimax_bt.ko
- **Interface**: USB
- **Replaces**: Standard btusb module for Realtek devices

## Troubleshooting

### WiFi not working
```bash
# Check if module is loaded
lsmod | grep rt8723du

# Check kernel messages
dmesg | grep -i rtl

# Reload the module
sudo modprobe -r rt8723du
sudo modprobe rt8723du
```

### Bluetooth not working

**IMPORTANT**: The built-in kernel `btusb` driver must be blacklisted for the custom `edimax_bt` driver to work properly. The DKMS installation script handles this automatically, but you need to reboot or manually unload btusb.

```bash
# After installation, check if btusb is loaded (it shouldn't be)
lsmod | grep btusb

# If btusb is loaded, unload it
sudo rmmod btusb

# Then load the edimax_bt driver
sudo modprobe edimax_bt

# Check if module is loaded
lsmod | grep edimax_bt

# Check Bluetooth service
sudo systemctl status bluetooth

# Restart Bluetooth
sudo systemctl restart bluetooth

# Check for Bluetooth controllers
bluetoothctl list

# If bluetoothctl shows no controllers, check dmesg
dmesg | grep -i bluetooth
```

**Bluetooth MAC address showing 00:00:00:00:00:00**: This indicates the built-in btusb driver is being used instead of edimax_bt. The built-in driver doesn't properly load firmware for these devices. Solution:
1. Ensure btusb is blacklisted: `cat /etc/modprobe.d/btusb-blacklist.conf`
2. Reboot your system, OR run `sudo rmmod btusb && sudo modprobe edimax_bt`
3. Verify the correct driver is loaded: `inxi --bluetooth` should show `driver: edimax_bt`

**Note for Kernel 4.1+**: The Bluetooth driver includes an HCI setup callback required for modern kernels. Firmware is downloaded during device initialization to ensure proper MAC address configuration.

### DKMS build failures
```bash
# Check DKMS status
dkms status

# View build logs
cat /var/lib/dkms/rtl8723du/5.6.1/build/make.log
cat /var/lib/dkms/edimax_bt/3.1/build/make.log
```

### Module load errors (Exec format error or version magic mismatch)

If you see errors like:
```
modprobe: ERROR: could not insert 'rt8723du': Exec format error
```
or
```
rt8723du: version magic '6.18.2-rt3 SMP preempt_rt mod_unload' should be '6.18.2-rt3-tkg-bore SMP preempt_rt mod_unload'
```

This means the module was compiled for a different kernel version than the one currently running. This commonly happens with:
- Custom kernels (like -tkg, -zen, -hardened, etc.)
- Kernel updates after building the module
- Using wrong kernel headers

**Solution:**

1. **Ensure correct kernel headers are installed:**
   ```bash
   # Check your running kernel version
   uname -r
   
   # Install matching headers (Ubuntu/Debian)
   sudo apt-get install linux-headers-$(uname -r)
   
   # Install matching headers (Arch Linux)
   sudo pacman -S linux-headers  # or linux-zen-headers, linux-hardened-headers, etc.
   
   # Install matching headers (Fedora/RHEL)
   sudo dnf install kernel-devel-$(uname -r)
   ```

2. **Rebuild the module with DKMS (recommended):**
   ```bash
   # Remove old build
   sudo dkms remove -m rtl8723du -v 5.6.1 --all
   
   # Reinstall with correct headers
   sudo ./dkms-install.sh
   ```

3. **Or rebuild manually:**
   ```bash
   cd WIFI
   make clean
   make
   sudo make install
   sudo modprobe rt8723du
   ```

4. **Verify the module matches your kernel:**
   ```bash
   # Check running kernel version
   uname -r
   
   # Check module version
   modinfo rt8723du | grep vermagic
   ```
   
   The `vermagic` should exactly match your kernel version from `uname -r`.

## Supported Kernels

These drivers support Linux kernels 3.x through 6.x (including 6.18+). The DKMS installation method ensures compatibility across kernel updates.

### Recent Improvements

**Bluetooth MAC Address and Controller Detection (Kernel 4.1+)**: The Bluetooth driver now properly downloads firmware in the HCI setup callback required by modern Linux kernels. This fixes issues where:
- The Bluetooth controller shows MAC address `00:00:00:00:00:00`
- The Bluetooth module loads successfully but controllers are not properly configured
- Controllers are not visible to `bluetoothctl` or other userspace tools

The firmware is now loaded during device setup (before the device is opened) on kernels 4.1+, ensuring the device is properly configured with its MAC address and ready for use. If you previously experienced these issues on newer kernels, updating to this version should resolve them.

## License

Please refer to the individual source files for license information.
