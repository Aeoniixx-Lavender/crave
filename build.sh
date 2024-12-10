#!/bin/bash

export BUILD_USERNAME=Aeonix;

source build/envsetup.sh;
lunch pixelstar_lavender-userdebug;
make bacon -j$(nproc --all)
