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

# Extract prebuilt vendor
sh vendor/xiaomi/fleur/unpack-vendor.sh
