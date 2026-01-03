DRV_SRC_DIR	:= bluetooth_uart_driver
MDL_DIR	:= /lib/modules/$(shell uname -r)
DRV_DIR	:= $(MDL_DIR)/kernel/drivers/bluetooth

TOOL_SRC_DIR := rtk_hciattach
TOOL_DIR := /usr/sbin

install:
	mkdir -p $(DRV_DIR)
	- rmmod edimax_btuart
	make -C $(DRV_SRC_DIR)
	#mv -n $(DRV_DIR)/edimax_btuart.ko $(FW_DIR)/edimax_btuart.bk
	cp -f $(DRV_SRC_DIR)/edimax_btuart.ko $(DRV_DIR)/edimax_btuart.ko
	depmod -a $(shell uname -r)
	make -C $(DRV_SRC_DIR) clean
	echo "make edimax_btuart_driver success!"
	make -C $(TOOL_SRC_DIR)
	cp -f $(TOOL_SRC_DIR)/rtk_hciattach $(TOOL_DIR)/rtk_hciattach
	make -C $(TOOL_SRC_DIR) clean
	echo "make rtk_hciattach success!"

uninstall:
	mv -f $(FW_DIR)/edimax_btuart.bk $(DRV_DIR)/edimax_btuart.ko
	depmod -a $(shell uname -r)
	- rm -f $(FW_DIR)/edimax_btuart.bk
	rm -f $(FW_DIR)/rtlbt_fw
	rm -f $(FW_DIR)/rtlbt_config
	echo "uninstall edimax_btuart_driver success!"
	rm -f $(TOOL_DIR)/rtk_hciattach
	echo "uninstall rtk_hciattach success!"

