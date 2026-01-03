FW_DIR	:= /lib/firmware/rtl_bt
FW_NAME := rtl8723du_fw
CF_NAME := rtl8723du_config
all:
	@echo "Copy RTL8723D fw/config to $(FW_DIR)"
	cp -f $(FW_NAME) $(FW_DIR)/$(FW_NAME)
	cp -f $(CF_NAME) $(FW_DIR)/$(CF_NAME)
clean:
