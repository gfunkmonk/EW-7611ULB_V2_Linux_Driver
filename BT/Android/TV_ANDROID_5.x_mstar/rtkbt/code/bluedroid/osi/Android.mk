LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_C_INCLUDES := \
    $(LOCAL_PATH)/include

LOCAL_SRC_FILES := \
    ./src/alarm.c \
    ./src/config.c \
    ./src/fixed_queue.c \
    ./src/list.c \
    ./src/reactor.c \
    ./src/semaphore.c \
    ./src/thread.c

LOCAL_CFLAGS := -std=c99 -Wall -Werror
ifeq ($(BOARD_HAVE_BLUETOOTH_RTK),true)
LOCAL_MODULE := libosi_rtk
else
LOCAL_MODULE := libosi
endif
LOCAL_MODULE_TAGS := optional
LOCAL_SHARED_LIBRARIES := libc liblog
LOCAL_MODULE_CLASS := STATIC_LIBRARIES

include $(BUILD_STATIC_LIBRARY)

#####################################################

include $(CLEAR_VARS)

LOCAL_C_INCLUDES := \
    $(LOCAL_PATH)/include

LOCAL_SRC_FILES := \
    ./test/alarm_test.cpp \
    ./test/config_test.cpp \
    ./test/list_test.cpp \
    ./test/reactor_test.cpp \
    ./test/thread_test.cpp

LOCAL_CFLAGS := -Wall -Werror
ifeq ($(BOARD_HAVE_BLUETOOTH_RTK),true)
LOCAL_MODULE := ositests_rtk
else
LOCAL_MODULE := ositests
endif
LOCAL_MODULE_TAGS := tests
LOCAL_SHARED_LIBRARIES := liblog
ifeq ($(BOARD_HAVE_BLUETOOTH_RTK),true)
LOCAL_STATIC_LIBRARIES := libosi_rtk
else
LOCAL_STATIC_LIBRARIES := libosi
endif

include $(BUILD_NATIVE_TEST)
