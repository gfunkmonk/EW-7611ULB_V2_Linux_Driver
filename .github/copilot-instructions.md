This repository contains out-of-kernel drivers for Realtek's 8723d usb chipset.

## Code Standards

## Required Before Each Commit 
- Run 'pip install mbake', 'mbake format WIFI/Makefile' and 'mbake format BT/Makefile' to ensure proper formatting

## Repository Structure
- 'BT/': Contains the Bluetooth module source
- 'WIFI': Contains the WIFI module source

## Key Guidelines
1. Follow Go best practices and idiomatic patterns
2. Maintain existing code structure and organization
3. Maintain backwards compatibility with previous kernel versions, while also updating code to work with current kernel versions
4. When merging code do not remove guards like '#if (LINUX_VERSION_CODE > KERNEL_VERSION' unless completly needed
5. Do not remove 'CONFIG' variables from Makefiles
6. Optimize and streamline code where applicable
