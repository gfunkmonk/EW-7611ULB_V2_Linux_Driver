LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
ifeq ($(BOARD_HAVE_BLUETOOTH_RTK),true)
LOCAL_MODULE := rtkbt_stack.conf
else
LOCAL_MODULE := bt_stack.conf
endif
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT)/etc/bluetooth
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := $(LOCAL_MODULE)
include $(BUILD_PREBUILT)


include $(CLEAR_VARS)
ifeq ($(BOARD_HAVE_BLUETOOTH_RTK),true)
LOCAL_MODULE := rtkbt_did.conf
else
LOCAL_MODULE := bt_did.conf
endif
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT)/etc/bluetooth
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := $(LOCAL_MODULE)
include $(BUILD_PREBUILT)


include $(CLEAR_VARS)
ifeq ($(BOARD_HAVE_BLUETOOTH_RTK),true)
LOCAL_MODULE := rtkbt_auto_pair_devlist.conf
else
LOCAL_MODULE := auto_pair_devlist.conf
endif
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT)/etc/bluetooth
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES :=  $(LOCAL_MODULE)
include $(BUILD_PREBUILT)

