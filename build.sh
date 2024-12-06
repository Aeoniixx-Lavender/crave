#!/bin/bash
rm -rf .repo/local_manifests;

repo init -u https://github.com/Project-PixelStar/manifest -b 14-qpr3 --git-lfs;
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags;

git clone https://github.com/Aeoniixx-Lavender/local_manifests -b PixelStar-14 .repo/local_manifests;
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags;

export BUILD_USERNAME=Aeonix;

source build/envsetup.sh;
lunch pixelstar_lavender-userdebug;
make bacon -j$(nproc --all)
