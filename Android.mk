LOCAL_PATH := $(call my-dir)
ifeq ($(TARGET_DEVICE),fleur)
include $(call all-makefiles-under,$(LOCAL_PATH))
include $(CLEAR_VARS)
endif

ifneq ($(TARGET_TAP_TO_WAKE_NODE),)
  LOCAL_CFLAGS += -DTAP_TO_WAKE_NODE=\"$(TARGET_TAP_TO_WAKE_NODE)\"
endif
