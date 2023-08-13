#
# Copyright (C) 2020 The PixelExperience Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/xiaomi/fleur

# Inherit virtual_ab_ota product
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Include GSI keys
$(call inherit-product, $(SRC_TARGET_DIR)/product/developer_gsi_keys.mk)

# Get non-open-source specific aspects
$(call inherit-product, vendor/xiaomi/fleur/fleur-vendor.mk)

# A/B
AB_OTA_UPDATER := true

AB_OTA_PARTITIONS := \
    boot \
    dtbo \
    system \
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

# Bootctrl
PRODUCT_PACKAGES += \
    bootctrl.default \
    android.hardware.boot@1.2-impl \
    android.hardware.boot@1.2.recovery \
    android.hardware.boot@1.2-service

# Bluetooth Audio (System-side HAL, sysbta)
PRODUCT_PACKAGES += \
    audio.sysbta.default \
    android.hardware.bluetooth.audio-service-system

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/bluetooth/audio/config/sysbta_audio_policy_configuration.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysbta_audio_policy_configuration.xml \
    $(DEVICE_PATH)/bluetooth/audio/config/sysbta_audio_policy_configuration_7_0.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysbta_audio_policy_configuration_7_0.xml

# DT2W
PRODUCT_PACKAGES += \
    DT2W-Service-Fleur

# MIUI CAMERA
TARGET_ALTERNATIVE_FUTEX_WAITERS := true
TARGET_CAMERA_USES_NEWER_HIDL_OVERRIDE_FORMAT := true
TARGET_INCLUDES_MIUI_CAMERA := true
TARGET_USES_MIUI_CAMERA := true
$(call inherit-product, vendor/xiaomi/miuicamera/config.mk)

# Fastbootd
PRODUCT_PACKAGES += \
    fastbootd

# Fingerprint
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.fingerprint.xml

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/keylayout/uinput-fpc.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/uinput-fpc.kl \
    $(LOCAL_PATH)/configs/keylayout/uinput-goodix.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/uinput-goodix.kl

# ImsInit hack
PRODUCT_PACKAGES += \
    ImsInit

# ImsService
PRODUCT_PACKAGES += \
    com.android.ims.rcsmanager \
    PresencePolling \
    RcsService \
    ImsServiceBase

# Init
PRODUCT_PACKAGES += \
    init.mt6781.rc

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/init.mt6781.rc:$(TARGET_COPY_OUT_SYSTEM)/etc/init/init.mt6781.rc

# Health
PRODUCT_PACKAGES += \
    libsuspend \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-service

# Remove unwanted packages
PRODUCT_PACKAGES += \
    RemovePackages

# HIDL
PRODUCT_PACKAGES += \
    android.hidl.base@1.0_system \
    android.hidl.manager@1.0_system \
    libhidltransport \
    libhwbinder 

# Kernel
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilts/dtb.img:dtb.img

# Lights
PRODUCT_PACKAGES += \
    android.hardware.lights-service.fleur

# MTK In-call service
PRODUCT_PACKAGES += \
    MtkInCallService

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay \
    $(LOCAL_PATH)/overlay-aosp

# Runtime Resource Overlays
PRODUCT_PACKAGES += \
    FrameworksResOverlayFleur \
    TetheringOverlayFleur \
    WifiOverlayFleur \
    SystemUIOverlayFleur \
    SettingsOverlayFleur \
    SimpleDeviceConfigOverlayfleur

# Runtine Device Name Overlays
PRODUCT_PACKAGES += \
    FleurSettingsProviderOverlay \
    FleurpSettingsProviderOverlay \
    MielSettingsProviderOverlay \
    MielpSettingsProviderOverlay

# Permissions
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/permissions/privapp-permissions-com.mediatek.ims.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-com.mediatek.ims.xml

# Few Properties
PRODUCT_PROPERTY_OVERRIDES += \
        ro.secure=0 \
        ro.adb.secure=1 \
        ro.debuggable=1 \
        persist.service.adb.enable=1 \
        persist.sys.usb.config=adb,mtp
# Parts
PRODUCT_PACKAGES += \
    XiaomiParts

# Ramdisk
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/fstab.mt6781:$(TARGET_COPY_OUT_RECOVERY)/root/first_stage_ramdisk/fstab.mt6781

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(DEVICE_PATH)

# Symbols
PRODUCT_PACKAGES += \
    libshim_vtservice \
    libshim_beanpod.vendor

# Setup dalvik vm configs
$(call inherit-product, frameworks/native/build/phone-xhdpi-4096-dalvik-heap.mk)

# Telephony
PRODUCT_BOOT_JARS += \
    mediatek-common \
    mediatek-framework \
    mediatek-ims-base \
    mediatek-ims-common \
    mediatek-telecom-common \
    mediatek-telephony-base \
    mediatek-telephony-common

# VNDK
PRODUCT_TARGET_VNDK_VERSION := 31
PRODUCT_EXTRA_VNDK_VERSIONS := 31
