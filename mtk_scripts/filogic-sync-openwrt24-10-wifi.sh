#!/bin/sh
echo "clone repos"
git clone --branch openwrt-24.10 https://gerrit.mediatek.inc/openwrt/lede openwrt
git clone --branch master https://gerrit.mediatek.inc/openwrt/feeds/mtk_openwrt_feeds


echo "sync openwrt kernel..........."

cd openwrt
bash ../mtk_openwrt_feeds/autobuild/unified/autobuild.sh filogic-mac80211-mt7988_rfb-mt7996 prepare


cd -



echo "gen wifi7 mac80211 patches.........."
cp meta-cmf-filogic/mtk_scripts/rdkb_inc_helper openwrt/package/kernel/mac80211/patches
cd openwrt/package/kernel/mac80211/patches
./rdkb_inc_helper subsys/
./rdkb_inc_helper build/
mv subsys.inc subsys
mv build.inc build
mkdir patches
cp -r subsys patches
cp -r build patches
cd -
rm -rf meta-filogic/recipes-wifi/linux-mac80211/files/kernelv6-patches/*
cp -rf openwrt/package/kernel/mac80211/patches/patches/* meta-filogic/recipes-wifi/linux-mac80211/files/kernelv6-patches/

ver2=`grep "PKG_VERSION:=" openwrt/package/kernel/mac80211/Makefile | cut -c 14-`
sed -i 's/PV_kernelv6=.*/PV_kernelv6= "'${ver2}'"/g' meta-filogic/recipes-wifi/linux-mac80211/version.inc
ver3=`grep "PKG_HASH" openwrt/package/kernel/mac80211/Makefile | cut -c 11-`
sed -i 's/SHASUM-kernelv6 =.*/SHASUM-kernelv6 = "'${ver3}'"/g' meta-filogic/recipes-wifi/linux-mac80211/version.inc

echo "mt76_3.x patches for kernel 6.6 support "
cp meta-cmf-filogic/mtk_scripts/rdkb_inc_helper openwrt/package/kernel/mt76
cd openwrt/package/kernel/mt76
./rdkb_inc_helper patches
mv patches.inc patches
cd -
rm -rf meta-filogic/recipes-wifi/linux-mt76/files/kernelv6-patches
cp -rf openwrt/package/kernel/mt76/patches meta-filogic/recipes-wifi/linux-mt76/files/kernelv6-patches

ver=`grep "PKG_SOURCE_VERSION" openwrt/package/kernel/mt76/Makefile | cut -c 21-`
sed -i 's/SRCREV_kernelv6 =.*/SRCREV_kernelv6 = "'$ver'"/g' meta-filogic/recipes-wifi/linux-mt76/mt76-3x.inc

echo "copy mt76 firmware.........."
rm -rf meta-filogic/recipes-wifi/linux-mt76/files/kernelv6-src/*
cp -rf openwrt/package/kernel/mt76/src/* meta-filogic/recipes-wifi/linux-mt76/files/kernelv6-src/

echo "gen new hostapd patches for kernel 6.6 version"



cp meta-cmf-filogic/mtk_scripts/rdkb_inc_helper openwrt/package/network/services/hostapd
cd openwrt/package/network/services/hostapd

./rdkb_inc_helper patches
mv patches.inc patches


echo "Update hostapd bb file version.........."

cd -
ver=`grep "PKG_SOURCE_VERSION" openwrt/package/network/services/hostapd/Makefile | cut -c 21-`
sed -i 's/SRCREV_kernelv6 =.*/SRCREV_kernelv6 = "'$ver'"/g' meta-filogic/recipes-wifi/hostapd/version.inc
sed -i 's/SRCREV_kernelv6 =.*/SRCREV_kernelv6 = "'$ver'"/g' meta-filogic/recipes-wifi/wpa-supplicant/version.inc

echo "Update atenl ...... "
cp -rf mtk_openwrt_feeds/feed/app/atenl/src meta-filogic/recipes-wifi/atenl/files/
cp -f mtk_openwrt_feeds/feed/app/atenl/files/ated.sh meta-filogic/recipes-wifi/atenl/files/
cp -f mtk_openwrt_feeds/feed/app/atenl/files/iwpriv.sh meta-filogic/recipes-wifi/atenl/files/

echo "Update WiFi7 libubox version.........."
ver=`grep "PKG_SOURCE_VERSION" openwrt/package/libs/libubox/Makefile | cut -c 21-`
sed -i 's/wifi7_ver =.*/wifi7_ver = "'$ver'"/g' meta-filogic/recipes-wifi/libubox/libubox_git.bbappend

echo "Update libnl-tiny version.........."
ver=`grep "PKG_SOURCE_VERSION" openwrt/package/libs/libnl-tiny/Makefile | cut -c 21-`
sed -i 's/SRCREV_kernelv6 =.*/SRCREV_kernelv6 = "'$ver'"/g' meta-filogic/recipes-wifi/libnl-tiny/libnl-tiny_git.bb

echo "Update WiFi7 ubus version.........."
ver=`grep "PKG_SOURCE_VERSION" openwrt/package/system/ubus/Makefile | cut -c 21-`
sed -i 's/wifi7_ver =.*/wifi7_ver = "'$ver'"/g' meta-filogic/recipes-wifi/ubus/ubus_git.bb

echo "Update WiFi7 ucode version.........."
ver=`grep "PKG_SOURCE_VERSION" openwrt/package/utils/ucode/Makefile | cut -c 21-`
sed -i 's/SRCREV ?=.*/SRCREV ?= "'$ver'"/g' meta-filogic/recipes-wifi/ucode/ucode_git.bb

echo "Update WiFi7 udebug version.........."
ver=`grep "PKG_SOURCE_VERSION" openwrt/package/libs/udebug/Makefile | cut -c 21-`
sed -i 's/SRCREV ?=.*/SRCREV ?= "'$ver'"/g' meta-filogic/recipes-wifi/udebug/udebug_git.bb

ver=`grep "PKG_VERSION:=" openwrt/package/network/utils/iw/Makefile | cut -c 14-`
newbb=iw_${ver}.bb
cd meta-filogic/recipes-wifi/iw/
oldbb=`ls *.bb`
echo "Update iw bb file name.........."
mv ${oldbb} ${newbb}
cd -

echo "Update iw bb hash .........."
hash1=`grep "PKG_HASH" openwrt/package/network/utils/iw/Makefile | cut -c 11-`
sed -i 's/SRC_URI\[sha256sum\].*/SRC_URI[sha256sum] = "'${hash1}'"/g' meta-filogic/recipes-wifi/iw/${newbb}

echo "update wifi7 iw patches"
rm -rf meta-filogic/recipes-wifi/iw/patches-mlo
cp meta-cmf-filogic/mtk_scripts/rdkb_inc_helper openwrt/package/network/utils/iw/
cd openwrt/package/network/utils/iw/
./rdkb_inc_helper patches
mv patches.inc patches
cd -
mkdir meta-filogic/recipes-wifi/iw/patches-mlo
cp -rf openwrt/package/network/utils/iw/patches/* meta-filogic/recipes-wifi/iw/patches-mlo/

rm -rf meta-filogic/recipes-wifi/hostapd/files/kernelv6-patches
rm -rf meta-filogic/recipes-wifi/wpa-supplicant/files/kernelv6-patches
cp -rf openwrt/package/network/services/hostapd/patches meta-filogic/recipes-wifi/hostapd/files/kernelv6-patches
cp -rf openwrt/package/network/services/hostapd/patches meta-filogic/recipes-wifi/wpa-supplicant/files/kernelv6-patches
cp -rf openwrt/package/network/config/wifi-scripts/files/usr/share/hostap/*uc meta-filogic/recipes-wifi/hostapd/files/kernelv6-uc-files/
cp -rf openwrt/package/network/services/hostapd/files/*uc meta-filogic/recipes-wifi/hostapd/files/kernelv6-uc-files/


echo "Sync wifi from OpenWRT done , ready to commit meta-filogic!!!"
exit 0