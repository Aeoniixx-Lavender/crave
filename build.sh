#!/bin/bash

repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags;

export BUILD_USERNAME=Aeonix;

source build/envsetup.sh;
lunch pixelstar_lavender-user;
make bacon
