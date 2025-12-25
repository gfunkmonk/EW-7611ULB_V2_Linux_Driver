RTK_BT_FIRMWARE_DIR := rtl8852a
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/$(RTK_BT_FIRMWARE_DIR)_fw:system/etc/firmware/rtl8852a_fw \
	$(LOCAL_PATH)/$(RTK_BT_FIRMWARE_DIR)_config:system/etc/firmware/rtl8852a_config