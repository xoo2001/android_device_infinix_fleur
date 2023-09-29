echo "Downloading Prebuilt Vendor, Please Wait A Few Minutes"
cd device/xiaomi/fleur/prebuilts || echo "Make Sure You Are Running This Script Only From Root Directory Of Rom Source"
sudo apt install -y aria2
aria2c https://github.com/RT1648/Extras/releases/download/13.0.9.0/vendor.img
echo "Download Completed, Now You Can Build"
