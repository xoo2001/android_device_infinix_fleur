#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#
# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common LineageOS stuff
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit from fleur device
$(call inherit-product, $(LOCAL_PATH)/device.mk)

# Bootanimation
TARGET_BOOT_ANIMATION_RES := 1080

PRODUCT_DEVICE := X695C
PRODUCT_NAME := lineage_X695C
PRODUCT_BRAND := Infinix
PRODUCT_MODEL := Infinix Hot 20S (X695C)
PRODUCT_MANUFACTURER := Infinix

PRODUCT_GMS_CLIENTID_BASE := android-transsion

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="sys_tssi_64_infinix-user 12 SP1A.210812.016 353179 release-keys"

BUILD_FINGERPRINT := Infinix/X695C-OP/Infinix-X695C:12/SP1A.210812.016/230613V911:user/release-keys
