SRC_DIR	:= ./bluetooth_usb_driver
MDL_DIR	:= /lib/modules/$(shell uname -r)
DRV_DIR	:= $(MDL_DIR)/extras

##########################################
install:
	- rmmod btusb
	- mv $(DRV_DIR)/btusb.ko $(DRV_DIR)/btusb_bak
	- rmmod edimax_bt
	make -C $(SRC_DIR)
	cp -f $(SRC_DIR)/edimax_bt.ko $(DRV_DIR)/edimax_bt.ko
	depmod -a $(shell uname -r)
	make -C $(SRC_DIR) clean
	echo "install edimax_bt success!"

##########################################

uninstall:
	- mv -n $(DRV_DIR)/btusb_bak $(DRV_DIR)/btusb.ko
	- rmmod edimax_bt
	rm -f $(DRV_DIR)/edimax_bt.ko
	depmod -a $(shell uname -r)
	echo "uninstall edimax_bt success!"
##########################################

