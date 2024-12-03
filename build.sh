#!/bin/bash
rm -rf .repo/local_manifests;

repo init -u https://github.com/The-Pixel-Project/manifest -b fourteen-qpr3 -g default,-mips,-darwin,-notdefault --git-lfs;
git clone https://github.com/Aeoniixx-Lavender/local_manifests -b TPP-14 .repo/local_manifests;
git clone https://github.com/Evolution-X/vendor_evolution-priv_keys-template.git vendor/tpp-priv/keys;

/opt/crave/resync.sh;

cd vendor/tpp-priv/keys/;
bash keys.sh;
cd /tmp/src/android;

export BUILD_USERNAME=Aeonix;
export BUILD_HOSTNAME=Crave;

source build/envsetup.sh;
lunch aosp_lavender-userdebug;
make bacon -j$(nproc --all)