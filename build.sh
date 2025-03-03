#!/bin/bash

repo sync -c --force-sync --optimized-fetch --no-tags --no-clone-bundle --prune -j16;

source build/envsetup.sh;
lunch aosp_lavender-ap4a-userdebug;
make bacon
