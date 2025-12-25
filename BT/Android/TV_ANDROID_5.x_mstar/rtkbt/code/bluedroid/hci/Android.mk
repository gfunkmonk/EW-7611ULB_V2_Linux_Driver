LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

ifeq ($(BOARD_HAVE_BLUETOOTH_RTK),true)
else
LOCAL_CFLAGS += $(bdroid_CFLAGS)
endif

LOCAL_SRC_FILES := \
	src/bt_hci_bdroid.c \
	src/btsnoop.c \
	src/btsnoop_net.c \
	src/lpm.c \
	src/utils.c \
	src/vendor.c

LOCAL_CFLAGS := -Wno-unused-parameter

ifeq ($(BLUETOOTH_HCI_USE_MCT_RTK),true)

LOCAL_CFLAGS += -DHCI_USE_MCT

LOCAL_SRC_FILES += \
	src/hci_mct.c \
	src/userial_mct.c

else
LOCAL_SRC_FILES += \
        src/hci_h4.c \
        src/userial.c

ifeq ($(BOARD_HAVE_BLUETOOTH_RTK),true)
LOCAL_SRC_FILES += \
        src/hci_h5.c \
        src/bt_skbuff.c \
        src/bt_list.c

ifeq ($(BOARD_HAVE_BLUETOOTH_RTK_HEARTBEAT),true)
LOCAL_SRC_FILES += \
        src/poll.c
endif

ifeq ($(BOARD_HAVE_BLUETOOTH_RTK_COEX),true)
LOCAL_SRC_FILES += \
        src/rtk_parse.c

LOCAL_C_INCLUDES += \
        $(LOCAL_PATH)/../stack/include \
        $(LOCAL_PATH)/../gki/ulinux
endif
endif
endif

LOCAL_CFLAGS += -std=c99

LOCAL_C_INCLUDES += \
	$(LOCAL_PATH)/include \
	$(LOCAL_PATH)/../osi/include \
	$(LOCAL_PATH)/../utils/include \
        $(bdroid_C_INCLUDES)

ifeq ($(BOARD_HAVE_BLUETOOTH_RTK),true)
LOCAL_CFLAGS += $(rtkbt_bdroid_CFLAGS)
endif
ifeq ($(BOARD_HAVE_BLUETOOTH_RTK),true)
LOCAL_MODULE := libbt-hci_rtk
else
LOCAL_MODULE := libbt-hci
endif
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := STATIC_LIBRARIES

include $(BUILD_STATIC_LIBRARY)
