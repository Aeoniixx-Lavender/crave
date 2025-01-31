#!/bin/bash

repo sync -c --force-sync --optimized-fetch --no-tags --no-clone-bundle --prune -j16;

export BUILD_USERNAME=Aeoniixx;
export BUILD_HOSTNAME=Aeoniixx;

source build/envsetup.sh;
lunch flare_lavender-ap4a-userdebug;
make bacon
