# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common SuperiorOS stuff
$(call inherit-product, vendor/superior/config/common.mk)

# Inherit from fleur device
$(call inherit-product, $(LOCAL_PATH)/device.mk)

# Build Flags
TARGET_INCLUDE_PIXEL_CHARGER := true
TARGET_SUPPORTS_QUICK_TAP := true
TARGET_FACE_UNLOCK_SUPPORTED := true
USE_MOTO_CALCULATOR := true
USE_DOTGALLERY := true
IS_PHONE := true
BUILD_WITH_GAPPS := true

PRODUCT_BRAND := Redmi
PRODUCT_DEVICE := fleur
PRODUCT_NAME := superior_fleur
PRODUCT_MODEL := Redmi Note 11S 4G
PRODUCT_MANUFACTURER := Xiaomi
TARGET_BOOT_ANIMATION_RES := 1080
PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

