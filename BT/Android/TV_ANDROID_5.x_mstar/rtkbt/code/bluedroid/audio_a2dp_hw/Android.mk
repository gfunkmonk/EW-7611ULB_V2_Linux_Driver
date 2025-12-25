LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
	audio_a2dp_hw.c

# MStar Android Patch Begin
# support all audio path output through a2dp
LOCAL_C_INCLUDES += \
	. \
	$(TOP)/external/tinyalsa/include \
	$(TOP)/system/media/audio_utils/include \
	$(LOCAL_PATH)/../utils/include

# realtek patch 
LOCAL_CFLAGS += -DBLUETOOTH_RTK

# MStar Android Patch End
LOCAL_CFLAGS += -std=c99

LOCAL_MODULE := audio.a2dp.rtk
LOCAL_MODULE_RELATIVE_PATH := hw

# MStar Android Patch Begin
LOCAL_SHARED_LIBRARIES := libcutils liblog libtinyalsa libaudioutils

#add 32
LOCAL_MULTILIB := 32

LOCAL_MODULE_TAGS := optional

include $(BUILD_SHARED_LIBRARY)
