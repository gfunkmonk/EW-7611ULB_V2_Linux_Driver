RTK_BT_FIRMWARE_DIR := rtl8723d
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/$(RTK_BT_FIRMWARE_DIR)_fw:system/etc/firmware/rtl8723d_fw \
	$(LOCAL_PATH)/$(RTK_BT_FIRMWARE_DIR)_config:system/etc/firmware/rtl8723d_config