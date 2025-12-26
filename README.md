# EW-7611ULB_V2_Linux_Driver

Linux driver for EW-7611ULB V2 WiFi/Bluetooth USB adapter.

## Recent Improvements

### Code Quality and Security Updates (2025)
- Fixed critical preprocessor syntax errors (`#elif` → `#else`)
- Replaced unsafe string functions:
  - `sprintf()` → `snprintf()` for buffer overflow protection
  - `strcpy()/strcat()` → `snprintf()` for safer string operations
- Improved kernel version compatibility (Linux 6.12+)
- Enhanced security and reduced buffer overflow risks

## Build Instructions

### WiFi Driver
```bash
cd WIFI
make
sudo make install
```

### Bluetooth Driver
```bash
cd BT/Linux
sudo make install INTERFACE=usb    # For USB interface
sudo make install INTERFACE=uart   # For UART interface
sudo make install INTERFACE=all    # For both interfaces
```

## System Requirements
- Linux kernel 2.6.32 or later
- GCC 4.9 or later recommended
- Kernel headers for your running kernel

## Supported Devices
- Realtek RTL8723D WiFi/BT combo chips
- USB Vendor IDs: 0x0bda, 0x13d3, 0x0489, 0x1358, 0x04ca, 0x2ff8
- Multiple OEM variants supported

## License
GPL v2 - See individual source files for details
