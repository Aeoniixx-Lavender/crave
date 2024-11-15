#!/bin/bash
rm -rf .repo/local_manifests

repo init -u https://github.com/The-Pixel-Project/manifest -b fourteen-qpr3 -g default,-mips,-darwin,-notdefault --git-lfs
git clone https://github.com/Aeoniixx-Lavender/local_manifests -b TPP-14 .repo/local_manifests
/opt/crave/resync.sh

export BUILD_USERNAME=Aeoniixx 
export BUILD_HOSTNAME=Crave

subject='/C=IN/ST=Maharashtra/L=Mumbai/O=AOSP/OU=AOSP/CN=AOSP/emailAddress=aeoniixx@gmail.com'

for x in releasekey platform shared media networkstack verity otakey testkey cyngn-priv-app sdk_sandbox bluetooth verifiedboot nfc; do
    ./development/tools/make_key vendor/aosp/signing/keys/$x "$subject"
done

. build/envsetup.sh
lunch aosp_lavender-userdebug 
make bacon -j$(nproc --all)
