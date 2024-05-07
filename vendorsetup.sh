echo 'Start Cloning repos'
echo 'Cloning Vendor Trees'
# Vendor Blobs
rm -rf vendor/infinix/X695C
git clone https://github.com/hoshiyomiX/vendor_infinix_fleur vendor/infinix/X695C
echo 'Cloning Hardware Mediatek'
# Hardware Mediatek
rm -rf hardware/mediatek
git clone https://github.com/PQEnablers-Devices/android_hardware_mediatek hardware/mediatek
echo 'DONE'