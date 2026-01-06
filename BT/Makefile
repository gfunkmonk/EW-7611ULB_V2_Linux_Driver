SRC_DIR	:= ./bluetooth_usb_driver
MDL_DIR	:= /lib/modules/$(shell uname -r)
DRV_DIR	:= $(MDL_DIR)/kernel/drivers/bluetooth

FIRMWARE_DIR := firmware

##########################################
module:
	$(MAKE) -s -C $(FIRMWARE_DIR)
	$(MAKE) -s -C $(SRC_DIR)

install:
	$(MAKE) -C $(FIRMWARE_DIR)
	-@rmmod btusb 2>/dev/null || true
	-@rmmod rtk_btusb 2>/dev/null || true
	$(MAKE) -C $(SRC_DIR)
	@cp -f $(SRC_DIR)/rtk_btusbew7611ulbv2.ko $(DRV_DIR)/rtk_btusbew7611ulbv2.ko
	@depmod -a $(shell uname -r)
	$(MAKE) -C $(SRC_DIR) clean
	@echo "install rtk_btusb success!"

##########################################

uninstall:
	$(MAKE) -C $(FIRMWARE_DIR) clean
	-@mv -n $(DRV_DIR)/btusb_bak $(DRV_DIR)/btusb.ko 2>/dev/null || true
	-@rmmod rtk_btusb 2>/dev/null || true
	@rm -f $(DRV_DIR)/rtk_btusb.ko
	@depmod -a $(shell uname -r)
	@echo "uninstall rtk_btusb success!"
##########################################
