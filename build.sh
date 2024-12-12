#!/bin/bash

rm -rf .repo/local_manifests;

repo init -u https://github.com/Project-PixelStar/manifest -b 14-qpr3 --git-lfs;
repo sync -c --force-sync --optimized-fetch --no-tags --no-clone-bundle --prune -j$(nproc --all);

git clone https://github.com/Aeoniixx-Lavender/local_manifests -b PixelStar-14 .repo/local_manifests;
repo sync -c --force-sync --optimized-fetch --no-tags --no-clone-bundle --prune -j$(nproc --all);

export BUILD_USERNAME=Aeonix;

source build/envsetup.sh;
make clean;
lunch pixelstar_lavender-userdebug;
make bacon
