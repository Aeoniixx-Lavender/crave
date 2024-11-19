#!/bin/bash
rm -rf .repo/local_manifests

repo init -u https://github.com/The-Pixel-Project/manifest -b fourteen-qpr3 -g default,-mips,-darwin,-notdefault --git-lfs
git clone https://github.com/Aeoniixx-Lavender/local_manifests -b TPP-14 .repo/local_manifests
/opt/crave/resync.sh

export BUILD_USERNAME=Aeonix 
export BUILD_HOSTNAME=Crave

. build/envsetup.sh
lunch aosp_lavender-userdebug 
make bacon -j$(nproc --all)
