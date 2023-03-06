#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),fleur)
include $(call all-subdir-makefiles,$(LOCAL_PATH))
include $(CLEAR_VARS)

LIGHT_REPLACEMENT += $(TARGET_OUT_PRODUCT)/vendor_overlay/${PRODUCT_TARGET_VNDK_VERSION}/bin/hw/android.hardware.lights-service.mediatek
$(LIGHT_REPLACEMENT): $(LOCAL_INSTALLED_MODULE)
	@mkdir -p $(dir $@)
	$(hide) ln -s /system/bin/hw/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(LIGHT_REPLACEMENT)
endif

ifneq ($(TARGET_TAP_TO_WAKE_NODE),)
  LOCAL_CFLAGS += -DTAP_TO_WAKE_NODE=\"$(TARGET_TAP_TO_WAKE_NODE)\"
endif
