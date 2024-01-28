#
# Copyright (C) 2020 The PixelExperience Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/xiaomi/fleur
KERNEL_PATH := kernel/xiaomi/fleur

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
    $(DEVICE_PATH)/configs/apn/apns-conf.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/apns-conf.xml

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

# Fastbootd
PRODUCT_PACKAGES += \
    fastbootd

# Fingerprint
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.fingerprint.xml

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/keylayout/uinput-fpc.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/uinput-fpc.kl \
    $(LOCAL_PATH)/configs/keylayout/uinput-goodix.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/uinput-goodix.kl

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

# HIDL
PRODUCT_PACKAGES += \
    libhidltransport \
    libhwbinder

# Kernel
PRODUCT_COPY_FILES += \
    $(KERNEL_PATH)/dtb.img:dtb.img

# Lights
PRODUCT_PACKAGES += \
    android.hardware.lights-service.fleur

# MTK In-call service
PRODUCT_PACKAGES += \
    MtkInCallService

# NFC
PRODUCT_PACKAGES += \
    NfcNci \
    Tag \
    SecureElement \
    com.android.nfc_extras

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay \
    $(LOCAL_PATH)/overlay-lineage

# Runtime Resource Overlays
PRODUCT_PACKAGES += \
    FrameworksResOverlayFleur \
    TetheringOverlayFleur \
    WifiOverlayFleur \
    SystemUIOverlayFleur \
    SettingsOverlayFleur \
    SimpleDeviceConfigOverlayFleur

# Runtine Device Name Overlays
PRODUCT_PACKAGES += \
    FleurSettingsProviderOverlay \
    FleurpSettingsProviderOverlay \
    MielSettingsProviderOverlay \
    MielpSettingsProviderOverlay \
    SettingsLibOverlayFleur \
    SimpleDeviceConfigOverlayFleur

# Permissions
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/permissions/privapp-permissions-com.mediatek.ims.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-com.mediatek.ims.xml

# Power/Perf configs
 PRODUCT_COPY_FILES += \
    $(foreach file,$(wildcard $(LOCAL_PATH)/configs/perf/*), \
        $(file):$(addprefix $(TARGET_COPY_OUT_VENDOR)/etc/, $(notdir $(file))) )

# Power
PRODUCT_PACKAGES += \
    android.hardware.power-service.mediatek-libperfmgr

PRODUCT_PACKAGES += \
    android.hardware.power@1.0.vendor \
    android.hardware.power@1.1.vendor \
    android.hardware.power@1.2.vendor \
    android.hardware.power@1.3.vendor

PRODUCT_PACKAGES += \
    libmtkperf_client_vendor \
    libmtkperf_client

PRODUCT_PACKAGES += \
    vendor.mediatek.hardware.mtkpower@1.0.vendor \
    vendor.mediatek.hardware.mtkpower@1.1.vendor \
    vendor.mediatek.hardware.mtkpower@1.2-service.stub \
    vendor.qti.hardware.perf@2.2

# PowerOffAlarm
PRODUCT_PACKAGES += \
    PowerOffAlarm

# Ramdisk
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/fstab.mt6781:$(TARGET_COPY_OUT_RECOVERY)/root/first_stage_ramdisk/fstab.mt6781

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(DEVICE_PATH) \
    hardware/mediatek

# Telephony
PRODUCT_BOOT_JARS += \
    mediatek-common \
    mediatek-framework \
    mediatek-ims-base \
    mediatek-ims-common \
    mediatek-telecom-common \
    mediatek-telephony-base \
    mediatek-telephony-common

# Thermal
PRODUCT_PACKAGES += \
    android.hardware.thermal@2.0

# VNDK
PRODUCT_TARGET_VNDK_VERSION := 31
PRODUCT_EXTRA_VNDK_VERSIONS := 31
