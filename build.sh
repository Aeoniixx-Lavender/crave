#!/bin/bash
rm -rf .repo/local_manifests;

repo init -u https://github.com/The-Pixel-Project/manifest -b fourteen-qpr3 -g default,-mips,-darwin,-notdefault --git-lfs;
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags;

git clone https://github.com/Aeoniixx-Lavender/local_manifests -b TPP-14 .repo/local_manifests;
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags;

export BUILD_USERNAME=Aeonix;

source build/envsetup.sh;
lunch aosp_lavender-userdebug;
make bacon -j$(nproc --all)
