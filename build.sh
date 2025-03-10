#!/bin/bash

repo sync -c --force-sync --optimized-fetch --no-tags --no-clone-bundle --prune -j16;

rm -rf packages/apps/Aperture;
git clone https://github.com/Aeoniixx/android_packages_apps_Aperture -b lineage-22.1 packages/apps/Aperture;

chmod +x vendor/aosp/build/tools/createjson.sh;

source build/envsetup.sh;
make clean;
lunch aosp_lavender-ap4a-userdebug;
make bacon -j16
