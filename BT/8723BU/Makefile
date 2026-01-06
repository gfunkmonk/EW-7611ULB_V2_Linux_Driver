FW_DIR	:= /lib/firmware
FW_NAME := rtl8723b_fw
CF_NAME := rtl8723bu_config
all:
	@echo "Copy RTL8723BU fw/config to $(FW_DIR)"
	cp -f $(FW_NAME) $(FW_DIR)/$(FW_NAME)
	cp -f $(CF_NAME) $(FW_DIR)/$(CF_NAME)

clean:
	rm -f $(FW_DIR)/$(FW_NAME)
	rm -f $(FW_DIR)/$(CF_NAME)



