# ROM source patches

color="\033[0;32m"
end="\033[0m"

echo -e "${color}Applying patches${end}"
sleep 1

# Remove conflicting sepolicies
rm -rf system/sepolicy/vendor/hal_fingerprint_default.te
rm -rf system/sepolicy/vendor/hal_health_default.te
rm -rf system/sepolicy/vendor/rild.te
rm -rf system/sepolicy/vendor/hal_light_default.te
rm -rf system/sepolicy/vendor/mediacodec.te

# Define Other Required Dependencies
VENDOR=https://github.com/RT1648/vendor_xiaomi_fleur
VENDOR_PATH=vendor/xiaomi/fleur

KERNEL=https://github.com/RT1648/kernel_xiaomi_fleur
KERNEL_PATH=kernel/xiaomi/fleur

# Remove Existing Mediatek Hardware Libraries & Clone Custom Hardware Library
rm -rf hardware/mediatek
HARDWARE=https://github.com/PQEnablers-Devices/android_hardware_mediatek.git
HARDWARE_PATH=hardware/mediatek

# Clone Required Dependencies
git clone $VENDOR $VENDOR_PATH
git clone $KERNEL $KERNEL_PATH
git clone $HARDWARE $HARDWARE_PATH

# Extract prebuilt vendor
sh vendor/xiaomi/fleur/unpack-vendor.sh
