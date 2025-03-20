#!/bin/bash

repo sync -c --force-sync --optimized-fetch --no-tags --no-clone-bundle --prune -j16;

rm -rf packages/apps/Aperture;
git clone https://github.com/Aeoniixx/android_packages_apps_Aperture -b lineage-22.1 packages/apps/Aperture;

source build/envsetup.sh;
lunch aosp_lavender-ap4a-userdebug;
make bacon -j16
