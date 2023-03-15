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

# API level, the device has been commercially launched on
PRODUCT_SHIPPING_API_LEVEL := 30

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/$(PRODUCT_TARGET_VNDK_VERSION)/etc/audio_policy_configuration.xml

#APN config
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/apns-conf.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/apns-conf.xml

# VNDK
PRODUCT_TARGET_VNDK_VERSION := 31
PRODUCT_EXTRA_VNDK_VERSIONS := 31

# Dynamic partitions
PRODUCT_BUILD_SUPER_PARTITION := false
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# DT2W
PRODUCT_PACKAGES += \
    DT2W-Service-Fleur

# Fastbootd
PRODUCT_PACKAGES += \
    fastbootd

#Fingerprint
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.fingerprint.xml

# HIDL
PRODUCT_PACKAGES += \
    android.hidl.base@1.0_system \
    android.hidl.manager@1.0_system \
    libhidltransport \
    libhwbinder 

# Health
PRODUCT_PACKAGES += \
    libsuspend \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-service

# ImsInit hack
PRODUCT_PACKAGES += \
    ImsInit

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/permissions/privapp-permissions-mediatek.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-mediatek.xml \
    $(DEVICE_PATH)/configs/permissions/privapp-permissions-imsinit.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-imsinit.xml \
    $(DEVICE_PATH)/configs/permissions/com.mediatek.ims.plugin.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/com.mediatek.ims.plugin.xml \
    $(DEVICE_PATH)/configs/permissions/com.mediatek.op.ims.common.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/com.mediatek.op.ims.common.xml \
    $(DEVICE_PATH)/configs/permissions/com.mediatek.wfo.legacy.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/com.mediatek.wfo.legacy.xml \
    $(DEVICE_PATH)/configs/permissions/com.mediatek.engineermode.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/com.mediatek.engineermode.xml

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/public.libraries-trustonic.txt:$(TARGET_COPY_OUT_SYSTEM)/etc/public.libraries-trustonic.txt


# Lights
PRODUCT_PACKAGES += \
    android.hardware.lights-service.fleur

# Kernel
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilts/dtb.img:dtb.img

# Mtkperf
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/public.libraries.txt:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/$(PRODUCT_TARGET_VNDK_VERSION)/etc/public.libraries.txt

# MTK IMS Overlays
PRODUCT_PACKAGES += \
    mtk-ims \
    mtk-ims-telephony

# MtkInCallService
PRODUCT_PACKAGES += \
    MtkInCallService

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay

# Runtime Resource Overlays
PRODUCT_PACKAGES += \
    FrameworksResOverlayFleur \
    TetheringOverlayFleur \
    WifiOverlayFleur \
    SystemUIOverlayFleur \
    SettingsOverlayFleur

# Ramdisk
PRODUCT_PACKAGES += \
    init.mt6781.rc \
    fstab.mt6781

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/init.mt6781.rc:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/$(PRODUCT_TARGET_VNDK_VERSION)/etc/init/hw/init.mt6781.rc \
    $(LOCAL_PATH)/rootdir/etc/init.mediatek.rc:$(TARGET_COPY_OUT_SYSTEM)/etc/init/init.mediatek.rc

# Sensors
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/sensors/hals.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/hals.conf

# Symbols
PRODUCT_PACKAGES += \
    libshim_vtservice \
    libshim_beanpod.vendor

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(DEVICE_PATH)

# Properties
PRODUCT_COMPATIBLE_PROPERTY_OVERRIDE := true

# Telephony
PRODUCT_BOOT_JARS += \
    mediatek-common \
    mediatek-framework \
    mediatek-ims-base \
    mediatek-ims-common \
    mediatek-telecom-common \
    mediatek-telephony-base \
    mediatek-telephony-common
