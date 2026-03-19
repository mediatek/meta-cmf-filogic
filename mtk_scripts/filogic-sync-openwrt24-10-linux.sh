#!/bin/sh
echo "clone repos"
git clone --branch openwrt-24.10 https://gerrit.mediatek.inc/openwrt/lede openwrt
git clone --branch master https://gerrit.mediatek.inc/openwrt/feeds/mtk_openwrt_feeds


echo "sync openwrt kernel..........."

cd openwrt
bash ../mtk_openwrt_feeds/autobuild/unified/autobuild.sh filogic-mac80211-mt798x_rfb-wifi7_nic prepare


cd -
echo "sync generic kernel..........."
cp meta-cmf-filogic/mtk_scripts/rdkb_inc_helper openwrt/target/linux/generic/
cd openwrt/target/linux/generic/
./rdkb_inc_helper backport-6.6
mv backport-6.6.inc backport-6.6
./rdkb_inc_helper pending-6.6
mv pending-6.6.inc pending-6.6
./rdkb_inc_helper hack-6.6
mv hack-6.6.inc hack-6.6
cd -
rm -rf meta-filogic/recipes-kernel/linux/linux-mediatek-6.6/generic/backport-6.6
rm -rf meta-filogic/recipes-kernel/linux/linux-mediatek-6.6/generic/pending-6.6
rm -rf meta-filogic/recipes-kernel/linux/linux-mediatek-6.6/generic/hack-6.6
rm -rf meta-filogic/recipes-kernel/linux/linux-mediatek-6.6/generic/files
cp -rf openwrt/target/linux/generic/backport-6.6 meta-filogic/recipes-kernel/linux/linux-mediatek-6.6/generic
cp -rf openwrt/target/linux/generic/pending-6.6 meta-filogic/recipes-kernel/linux/linux-mediatek-6.6/generic
cp -rf openwrt/target/linux/generic/hack-6.6 meta-filogic/recipes-kernel/linux/linux-mediatek-6.6/generic
cp -rf openwrt/target/linux/generic/files meta-filogic/recipes-kernel/linux/linux-mediatek-6.6/generic
cp openwrt/target/linux/generic/config-6.6 meta-filogic/recipes-kernel/linux/linux-mediatek-6.6/generic/defconfig

echo "sync medaitek kernel..........."

rm -rf meta-filogic/recipes-kernel/linux/linux-mediatek-6.6/mediatek/flow_patch
cp meta-cmf-filogic/mtk_scripts/rdkb_inc_helper openwrt/target/linux/mediatek
cd openwrt/target/linux/mediatek/patches-6.6/
mkdir ../flow_patch
mv 999-30*.patch ../flow_patch
cd -
cd openwrt/target/linux/mediatek/
./rdkb_inc_helper patches-6.6/
mv patches-6.6.inc patches-6.6
sed -i 's/863-arm64-dts-mt7986-add-sound-wm8960.patch/&;apply=no/' patches-6.6/patches-6.6.inc
sed -i 's/999-2000-arm64-dts-mt7988-move-phys-to-sgmiipcs-and-usxgmiisy.patch/&;apply=no/' patches-6.6/patches-6.6.inc
sed -i 's/999-2001-arm64-dts-mt7988-aqr-10gphy-disable-eee.patch/&;apply=no/' patches-6.6/patches-6.6.inc
sed -i 's/999-2002-arm64-dts-mt7988-increase-mdc-for-aqr-10gphy.patch/&;apply=no/' patches-6.6/patches-6.6.inc
sed -i 's/999-2003-arm64-dts-mt7988-use-software-reset-for-aqr-10gphy.patch/&;apply=no/' patches-6.6/patches-6.6.inc
sed -i 's/999-2004-arm64-dts-mt7988-fix-typo-for-the-LAN-and-WAN-MAC-address.patch/&;apply=no/' patches-6.6/patches-6.6.inc
sed -i 's/999-2005-arm64-dts-mt7988-add-cpufreq-cooling-device.patch/&;apply=no/' patches-6.6/patches-6.6.inc
sed -i 's/999-2006-arm64-dts-mt7988-add-pcie-wifi-reset-support.patch/&;apply=no/' patches-6.6/patches-6.6.inc
sed -i 's/999-2138-dts-add-zts8232.patch/&;apply=no/' patches-6.6/patches-6.6.inc
sed -i 's/999-2757-net-dsa-add-an8855-v2p0p1-and-netlink-support.patch/&;apply=no/' patches-6.6/patches-6.6.inc
sed -i 's/999-2745-mtkhnat-add-mtkhnat-driver-support.patch/&;apply=no/' patches-6.6/patches-6.6.inc
sed -i 's/999-2775-net-ethernet-mtk_eth_soc-add-IEEE1588v2-support-for-NETSYSv3.1.patch/&;apply=no/' patches-6.6/patches-6.6.inc
sed -i 's/999-2781-net-ethernet-mtk_eth_soc-support-multiple-dsa-switch-PPPQ.patch/&;apply=no/' patches-6.6/patches-6.6.inc
sed -i 's/999-cpufreq-03-mediatek-enable-using-efuse-cali-data-for-mt7988-cpu-volt.patch/&;apply=no/' patches-6.6/patches-6.6.inc

cd -
rm -rf meta-filogic/recipes-kernel/linux/linux-mediatek-6.6/mediatek/patches-6.6
rm -rf meta-filogic/recipes-kernel/linux/linux-mediatek-6.6/mediatek/files-6.6
rm -rf meta-filogic/recipes-kernel/linux/linux-mediatek-6.6/mediatek/files

cp -rf openwrt/target/linux/mediatek/patches-6.6 meta-filogic/recipes-kernel/linux/linux-mediatek-6.6/mediatek
cp -rf openwrt/target/linux/mediatek/files-6.6 meta-filogic/recipes-kernel/linux/linux-mediatek-6.6/mediatek
cp -rf openwrt/target/linux/mediatek/files meta-filogic/recipes-kernel/linux/linux-mediatek-6.6/mediatek
cp -rf openwrt/target/linux/mediatek/flow_patch meta-filogic/recipes-kernel/linux/linux-mediatek-6.6/mediatek
cp openwrt/target/linux/mediatek/filogic/config-6.6 meta-filogic/recipes-kernel/linux/linux-mediatek-6.6/mediatek/filogic.cfg
echo "do medaitek kernel patch done..........."

#update kernel version
ver=`grep "LINUX_KERNEL_HASH-6" openwrt/include/kernel-6.6 | cut -c 19-25`
sed -i 's/LINUX_VERSION ?=.*/LINUX_VERSION ?= "'${ver}'"/g' meta-filogic/recipes-kernel/linux/linux-mediatek_6.6.bb
#end

echo "sync done..........."

#don't sync this kernl file,so remove it.it is download form logan repo
rm -rf meta-filogic/recipes-kernel/linux/linux-mediatek-5.4/mediatek/files-5.4/include/uapi/
#save sync mtk_openwrt_feeds log
cd mtk_openwrt_feeds/ && git log --oneline -n 200 > mtk_openwrt_feeds.log

echo "sync compelte..........."
exit 0