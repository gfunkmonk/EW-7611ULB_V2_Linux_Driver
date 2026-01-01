LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
        audio_a2dp_hw.c

# MStar Android Patch Begin
LOCAL_C_INCLUDES += \
        . \
        $(LOCAL_PATH)/../ \
        $(LOCAL_PATH)/../include \
        $(bdroid_C_INCLUDES) \
        $(LOCAL_PATH)/../utils/include \
        $(TOP)/external/tinyalsa/include \
        $(TOP)/system/media/audio_utils/include
# MStar Android Patch End

LOCAL_CFLAGS += -std=c99 $(bdroid_CFLAGS)

LOCAL_MODULE := audio.a2dp.rtk
LOCAL_MODULE_RELATIVE_PATH := hw

# MStar Android Patch Begin
LOCAL_SHARED_LIBRARIES := \
    libcutils \
    liblog \
    libtinyalsa \
    libaudioutils
# MStar Android Patch End
LOCAL_STATIC_LIBRARIES := libosi

LOCAL_MODULE_TAGS := optional

include $(BUILD_SHARED_LIBRARY)
