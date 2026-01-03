FW_USB_DIR := /lib/firmware
RTKBT_FIRMWARE_DIR := rtkbt-firmware/lib/firmware
MDL_DIR	:= /lib/modules/$(shell uname -r)
DRV_DIR	:= $(MDL_DIR)/extras

ccflags-y += Wno-missing-prototypes

install:
	@echo "Start Realtek Bluetooth USB driver installation"
	mkdir -p $(DRV_DIR)
	mkdir -p $(FW_USB_DIR)
	@echo "Copy $(RTKBT_FIRMWARE_DIR)/rtl*_fw to $(FW_USB_DIR)"
	cp -a $(RTKBT_FIRMWARE_DIR)/rtl*_fw $(FW_USB_DIR)
	@echo "Copy $(RTKBT_FIRMWARE_DIR)/rtl*_config to $(FW_USB_DIR)"
	cp -a $(RTKBT_FIRMWARE_DIR)/rtl*_config $(FW_USB_DIR)
	make -C usb install
