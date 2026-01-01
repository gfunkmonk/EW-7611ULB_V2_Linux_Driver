# EW-7611ULB_V2_Linux_Driver

Linux driver for the EW-7611ULB V2 USB WiFi/Bluetooth adapter (RTL8723D chipset).

## Recent Updates (December 2025)

This driver has been **modernized and optimized** for compatibility with modern Linux kernels (5.x/6.x):

### Key Improvements

✅ **Modernized Build System**
- Updated to use `ccflags-y` instead of deprecated `EXTRA_CFLAGS`
- Improved optimization from `-O1` to `-O2`
- Cleaned up obsolete compiler flag checks

✅ **Removed 100+ Obsolete Version Checks**
- Eliminated support for ancient kernel 2.6.x versions
- Now targets kernel 4.0+ as minimum
- Cleaner, more maintainable codebase

✅ **Updated 10+ Deprecated APIs**
- `complete_and_exit()` → `complete()` + `do_exit()`
- `strlcpy()` → `strscpy()`
- `ndev->dev_addr` → `eth_hw_addr_set()`
- `init_MUTEX()` → `mutex_init()`
- `GRO_DROP` → `GRO_CONSUMED` (kernel 6.0+)
- And more...

✅ **Better Repository Hygiene**
- Added `.gitignore` for build artifacts
- Removed obsolete platform-specific code
- Comprehensive documentation of changes

See [MODERNIZATION_SUMMARY.md](MODERNIZATION_SUMMARY.md) for complete details.

## Building the Driver

### WiFi Driver

```bash
cd WIFI
make
sudo make install
```

### Bluetooth Driver  

```bash
cd BT/Linux/usb/bluetooth_usb_driver
make
sudo insmod rtk_btusb.ko
```

## System Requirements

- **Linux Kernel**: 4.0 or newer (tested up to 6.11)
- **Architecture**: x86_64, ARM (configure `WIFI/Makefile` appropriately)
- **Build tools**: gcc, make, kernel headers

## Known Issues

The driver is currently undergoing modernization. Some minor compatibility issues remain for the latest kernels (6.x):
- cfg80211 API signature updates needed
- wireless_dev structure changes

These will be addressed in future updates.

## Troubleshooting

### Build Error: "generated/autoconf.h: No such file or directory"

If you encounter this error during build:
```
fatal error: generated/autoconf.h: No such file or directory
```

This means your kernel headers are not properly prepared. The Makefile will detect this and provide detailed instructions, but here's a quick fix:

**For distribution kernels (recommended):**
```bash
# Install kernel headers for your current kernel
sudo apt-get install linux-headers-$(uname -r)  # Ubuntu/Debian
sudo dnf install kernel-devel-$(uname -r)       # Fedora/RHEL
sudo pacman -S linux-headers                    # Arch Linux
```

**For custom kernels:**
If you've compiled a custom kernel, you need to prepare the headers:
```bash
cd /usr/src/linux-<your-kernel-version>
make oldconfig && make prepare && make modules_prepare
```

**Alternative:**
Point to a properly prepared kernel source directory:
```bash
cd WIFI
make KSRC=/path/to/prepared/kernel/source
```

## Platform Configuration

Edit `WIFI/Makefile` to set your platform:
- `CONFIG_PLATFORM_I386_PC = y` for x86_64
- `CONFIG_PLATFORM_ARM_RPI = y` for Raspberry Pi
- See Makefile for other platform options

## License

GPL v2

## Contributing

Contributions welcome! Please test changes against multiple kernel versions.

