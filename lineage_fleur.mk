# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Lineage stuff
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit from fleur device
$(call inherit-product, $(LOCAL_PATH)/device.mk)

PRODUCT_BRAND := xiaomi
PRODUCT_DEVICE := fleur
PRODUCT_MANUFACTURER := xiaomi
PRODUCT_NAME := lineage_fleur
PRODUCT_MODEL := fleur

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi
TARGET_VENDOR := xiaomi
TARGET_VENDOR_PRODUCT_NAME := fleur

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="fleur-user 12 SP1A.210812.016 V13.0.7.0.SKEMIXM release-keys"

BUILD_FINGERPRINT := Redmi/fleur/fleur:12/SP1A.210812.016/V13.0.7.0.SKEMIXM:user/release-keys
