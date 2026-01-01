LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_C_INCLUDES := \
	$(LOCAL_PATH)/include \
	$(LOCAL_PATH)/../gki/ulinux \
	$(bdroid_C_INCLUDES)

LOCAL_CFLAGS += $(bdroid_CFLAGS) -std=c99

LOCAL_PRELINK_MODULE :=false
LOCAL_SRC_FILES := \
	./src/bt_utils.c

ifeq ($(BOARD_HAVE_BLUETOOTH_RTK),true)
LOCAL_MODULE := libbt-utils_rtk
else
LOCAL_MODULE := libbt-utils
endif
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := STATIC_LIBRARIES

include $(BUILD_STATIC_LIBRARY)
