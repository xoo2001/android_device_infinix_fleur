# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common DerpFestOS stuff
$(call inherit-product, vendor/derp/config/common_full_phone.mk)

# Inherit from fleur device
$(call inherit-product, device/infinix/fleur/device.mk)

# Build Flags
TARGET_SUPPORTS_QUICK_TAP := true
TARGET_FACE_UNLOCK_SUPPORTED := true
TARGET_SUPPORTS_TOUCHGESTURES := true
TARGET_SUPPORTS_CALL_RECORDING := true
TARGET_NOT_USES_BLUR := true
DERP_BUILDTYPE := COMMUNITY

PRODUCT_BRAND := Infinix 
PRODUCT_DEVICE := fleur
PRODUCT_NAME := derp_fleur
PRODUCT_MODEL := Infinix Note 10 Pro
PRODUCT_MANUFACTURER := Infinix
TARGET_BOOT_ANIMATION_RES := 1440
PRODUCT_GMS_CLIENTID_BASE := android-infinix

# Build Fingerprint
BUILD_FINGERPRINT := "Infinix/X695C-GL/Infinix-X695C:11/RP1A.200720.011/221114V356:user/release-keys"
