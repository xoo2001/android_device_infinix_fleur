#
# Copyright (C) 2020 The PixelExperience Project
#
 # SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/infinix/X695C

# Inherit virtual_ab_ota product
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Include GSI keys
$(call inherit-product, $(SRC_TARGET_DIR)/product/developer_gsi_keys.mk)

# Get non-open-source specific aspects
$(call inherit-product, vendor/infinix/X695C/X695C-vendor.mk)

# A/B
AB_OTA_UPDATER := true

AB_OTA_PARTITIONS := \
    boot \
    dtbo \
    system \
    system_ext \
    product \
    vendor \
    vbmeta \
    vbmeta_system

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

PRODUCT_PACKAGES += \
    otapreopt_script

PRODUCT_PACKAGES += \
    update_engine \
    update_engine_sideload \
    update_verifier

PRODUCT_PACKAGES_DEBUG += \
    update_engine_client

# Dynamic partitions
PRODUCT_BUILD_SUPER_PARTITION := false
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# API level, the device has been commercially launched on
PRODUCT_SHIPPING_API_LEVEL := 30

# APN config
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/apns-conf.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/apns-conf.xml

# Android GO
PRODUCT_USE_PROFILE_FOR_BOOT_IMAGE := true
PRODUCT_DEX_PREOPT_BOOT_IMAGE_PROFILE_LOCATION := frameworks/base/config/boot-image-profile.txt

# Bootctrl
PRODUCT_PACKAGES += \
    bootctrl.default \
    android.hardware.boot@1.2-impl \
    android.hardware.boot@1.2.recovery \
    android.hardware.boot@1.2-service

# Bluetooth Audio (System-side HAL, sysbta)
#PRODUCT_PACKAGES += \
#    audio.sysbta.default \
#    android.hardware.bluetooth.audio-service-system

#PRODUCT_COPY_FILES += \
#    $(DEVICE_PATH)/bluetooth/audio/config/sysbta_audio_policy_configuration.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysbta_audio_policy_configuration.xml \
#    $(DEVICE_PATH)/bluetooth/audio/config/sysbta_audio_policy_configuration_7_0.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysbta_audio_policy_configuration_7_0.xml

# Dexpreopt
PRODUCT_DEXPREOPT_SPEED_APPS += \
    SettingsGoogle \
    SystemUIGoogle

# DT2W
#PRODUCT_PACKAGES += \
#    DT2W-Service-X695C

# Fastbootd
PRODUCT_PACKAGES += \
    fastbootd

# Fingerprint
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.fingerprint.xml

# ImsInit hack
#PRODUCT_PACKAGES += \
#    ImsInit

# ImsService
PRODUCT_PACKAGES += \
    com.android.ims.rcsmanager \
    PresencePolling \
    RcsService
#    ImsServiceBase

# Init
PRODUCT_PACKAGES += \
    init.mt6785.rc

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/init.mt6785.rc:$(TARGET_COPY_OUT_SYSTEM)/etc/init/init.mt6785.rc

# Health
PRODUCT_PACKAGES += \
    libsuspend \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-service

# HIDL
PRODUCT_PACKAGES += \
    android.hidl.base@1.0_system \
    android.hidl.manager@1.0_system \
    libhidltransport \
    libhwbinder 

# Kernel
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilts/dtb.img:dtb.img

# MTK In-call service
#PRODUCT_PACKAGES += \
#    MtkInCallService

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay \
    $(LOCAL_PATH)/overlay-aosp

# Runtime Resource Overlays
#PRODUCT_PACKAGES += \
#    FrameworksResOverlayX695C \
#    TetheringOverlayX695C \
#    WifiOverlayX695C \
#    SystemUIOverlayX695C \
#    SettingsOverlayX695C \
#    SettingsLibOverlayX695C \
#    SimpleDeviceConfigOverlayX695C

# Perf
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(DEVICE_PATH)/configs/perf/,$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/31/etc)

# Permissions
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/permissions/privapp-permissions-com.mediatek.ims.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-com.mediatek.ims.xml

# Ramdisk
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/fstab.mt6785:$(TARGET_COPY_OUT_RECOVERY)/root/first_stage_ramdisk/fstab.mt6785

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(DEVICE_PATH) \
    hardware/mediatek

# Symbols
#PRODUCT_PACKAGES += \
#    libshim_vtservice

# Setup dalvik vm configs
$(call inherit-product, frameworks/native/build/phone-xhdpi-6144-dalvik-heap.mk)

# Telephony
PRODUCT_BOOT_JARS += \
    mediatek-common \
    mediatek-framework \
    mediatek-ims-base \
    mediatek-ims-common \
    mediatek-telecom-common \
    mediatek-telephony-base \
    mediatek-telephony-common

# TextClassifier
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/textclassifier/actions_suggestions.universal.model:$(TARGET_COPY_OUT_SYSTEM)/etc/textclassifier/actions_suggestions.universal.model \
    $(LOCAL_PATH)/textclassifier/textclassifier.en.model:$(TARGET_COPY_OUT_SYSTEM)/etc/textclassifier/textclassifier.en.model \
    $(LOCAL_PATH)/textclassifier/lang_id.model:$(TARGET_COPY_OUT_SYSTEM)/etc/textclassifier/lang_id.model \
    $(LOCAL_PATH)/textclassifier/textclassifier.universal.model:$(TARGET_COPY_OUT_SYSTEM)/etc/textclassifier/textclassifier.universal.model

# VNDK
PRODUCT_TARGET_VNDK_VERSION := 31
PRODUCT_EXTRA_VNDK_VERSIONS := 31

USE_DEX2OAT_DEBUG := false
WITH_DEXPREOPT_DEBUG_INFO := false
PRODUCT_ALWAYS_PREOPT_EXTRACTED_APK := true

# Speed profile services and wifi-service to reduce RAM and storage.
PRODUCT_SYSTEM_SERVER_COMPILER_FILTER := speed-profile

# Do not generate libartd.
PRODUCT_ART_TARGET_INCLUDE_DEBUG_BUILD := false

# Strip the local variable table and the local variable type table to reduce
# the size of the system image. This has no bearing on stack traces, but will
# leave less information available via JDWP.
PRODUCT_MINIMIZE_JAVA_DEBUG_INFO := true

PRODUCT_DEX_PREOPT_DEFAULT_COMPILER_FILTER := verify

