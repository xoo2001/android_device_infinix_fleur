# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common SuperiorOS stuff
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit from fleur device
$(call inherit-product, $(LOCAL_PATH)/device.mk)

# Build Flags
TARGET_INCLUDE_PIXEL_CHARGER := true
TARGET_SUPPORTS_QUICK_TAP := true
TARGET_FACE_UNLOCK_SUPPORTED := true
TARGET_SUPPORTS_TOUCHGESTURES := true
TARGET_SUPPORTS_CALL_RECORDING := true

PRODUCT_BRAND := Redmi
PRODUCT_DEVICE := fleur
PRODUCT_NAME := lineage_fleur
PRODUCT_MODEL := Redmi Note 11S 4G
PRODUCT_MANUFACTURER := Xiaomi
TARGET_BOOT_ANIMATION_RES := 1440
PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

