#!/bin/sh
echo "clone repos"
git clone --branch openwrt-25.12 https://gerrit.mediatek.inc/openwrt/lede openwrt
git clone --branch master https://gerrit.mediatek.inc/openwrt/feeds/mtk_openwrt_feeds


echo "sync openwrt kernel..........."

cd openwrt
bash ../mtk_openwrt_feeds/autobuild/unified/autobuild.sh filogic-mac80211-mt798x_rfb-wifi7_nic prepare


cd -
echo "sync generic kernel..........."
cp meta-cmf-filogic/mtk_scripts/rdkb_inc_helper openwrt/target/linux/generic/
cd openwrt/target/linux/generic/
./rdkb_inc_helper backport-6.12
mv backport-6.12.inc backport-6.12
./rdkb_inc_helper pending-6.12
mv pending-6.12.inc pending-6.12
./rdkb_inc_helper hack-6.12
mv hack-6.12.inc hack-6.12
cd -
rm -rf meta-filogic/recipes-kernel/linux/linux-mediatek-6.12/generic/backport-6.12
rm -rf meta-filogic/recipes-kernel/linux/linux-mediatek-6.12/generic/pending-6.12
rm -rf meta-filogic/recipes-kernel/linux/linux-mediatek-6.12/generic/hack-6.12
rm -rf meta-filogic/recipes-kernel/linux/linux-mediatek-6.12/generic/files
cp -rf openwrt/target/linux/generic/backport-6.12 meta-filogic/recipes-kernel/linux/linux-mediatek-6.12/generic
cp -rf openwrt/target/linux/generic/pending-6.12 meta-filogic/recipes-kernel/linux/linux-mediatek-6.12/generic
cp -rf openwrt/target/linux/generic/hack-6.12 meta-filogic/recipes-kernel/linux/linux-mediatek-6.12/generic
cp -rf openwrt/target/linux/generic/files meta-filogic/recipes-kernel/linux/linux-mediatek-6.12/generic
cp openwrt/target/linux/generic/config-6.12 meta-filogic/recipes-kernel/linux/linux-mediatek-6.12/generic/defconfig

echo "sync medaitek kernel..........."

cd openwrt/target/linux/mediatek/files-6.12

cd - 
rm -rf meta-filogic/recipes-kernel/linux/linux-mediatek-6.12/mediatek/flow_patch

cp meta-cmf-filogic/mtk_scripts/rdkb_inc_helper openwrt/target/linux/mediatek
cd openwrt/target/linux/mediatek/patches-6.12/
mkdir ../flow_patch
mv 999-wed*.patch ../flow_patch
mv 999-ppe*.patch ../flow_patch
cd -
cd openwrt/target/linux/mediatek/
./rdkb_inc_helper patches-6.12/
mv patches-6.12.inc patches-6.12
sed -i 's/863-arm64-dts-mt7986-add-sound-wm8960.patch/&;apply=no/' patches-6.12/patches-6.12.inc
sed -i 's/999-dsa-03-add-an8855-netlink-support.patch/&;apply=no/' patches-6.12/patches-6.12.inc
sed -i 's/999-dts-04-arm64-dts-mediatek-add-mt7988-cpufreq-cooling-device.patch/&;apply=no/' patches-6.12/patches-6.12.inc
sed -i 's/999-dts-12-arm64-dts-mediatek-add-mt7981-pinctrl.patch/&;apply=no/' patches-6.12/patches-6.12.inc
sed -i 's/999-dts-13-arm64-dts-mediatek-add-mt7986-pinctrl.patch/&;apply=no/' patches-6.12/patches-6.12.inc
sed -i 's/999-dts-mt7981-rfb-03-add-pwm-pin-and-devices.patch/&;apply=no/' patches-6.12/patches-6.12.inc
sed -i 's/999-dts-mt7981-rfb-04-add-i2c-pin-and-devices.patch/&;apply=no/' patches-6.12/patches-6.12.inc
sed -i 's/999-dts-mt7981-rfb-05-arm64-dts-mediatek-add-gpio-keys-debounce.patch/&;apply=no/' patches-6.12/patches-6.12.inc
sed -i 's/999-dts-mt7981-rfb-06-arm64-dts-mediatek-add-wifi-device-node.patch/&;apply=no/' patches-6.12/patches-6.12.inc
sed -i 's/999-dts-mt7986a-rfb-01-arm64-dts-mediaek-refactor-pinctrl-node.patch/&;apply=no/' patches-6.12/patches-6.12.inc
sed -i 's/999-dts-mt7986a-rfb-08-arm64-dts-mediatek-fix-spim-nand-nor-dts-setting.patch/&;apply=no/' patches-6.12/patches-6.12.inc
sed -i 's/999-net-01-netdevice-add-macvlan-device-path-type.patch/&;apply=no/' patches-6.12/patches-6.12.inc

cd -
rm -rf meta-filogic/recipes-kernel/linux/linux-mediatek-6.12/mediatek/patches-6.12
rm -rf meta-filogic/recipes-kernel/linux/linux-mediatek-6.12/mediatek/files-6.12
rm -rf meta-filogic/recipes-kernel/linux/linux-mediatek-6.12/mediatek/files

cp -rf openwrt/target/linux/mediatek/patches-6.12 meta-filogic/recipes-kernel/linux/linux-mediatek-6.12/mediatek
cp -rf openwrt/target/linux/mediatek/files-6.12 meta-filogic/recipes-kernel/linux/linux-mediatek-6.12/mediatek
cp -rf openwrt/target/linux/mediatek/files meta-filogic/recipes-kernel/linux/linux-mediatek-6.12/mediatek
cp -rf openwrt/target/linux/mediatek/flow_patch meta-filogic/recipes-kernel/linux/linux-mediatek-6.12/mediatek
cp openwrt/target/linux/mediatek/filogic/config-6.12 meta-filogic/recipes-kernel/linux/linux-mediatek-6.12/mediatek/filogic.cfg
echo "do medaitek kernel patch done..........."

#update kernel version
ver=`grep "LINUX_KERNEL_HASH-6" openwrt/target/linux/generic/kernel-6.12 | cut -c 19-25`
sed -i 's/LINUX_VERSION ?=.*/LINUX_VERSION ?= "'${ver}'"/g' meta-filogic/recipes-kernel/linux/linux-mediatek_6.12.bb
#end

echo "Update switch tool ...... "
cp -rf mtk_openwrt_feeds/feed/app/switch/src meta-filogic/recipes-devtools/switch/files/

echo "Update mii_mgr tool ...... "
cp -rf mtk_openwrt_feeds/feed/app/mii_mgr/src meta-filogic/recipes-devtools/mii-mgr/files/

echo "Update regs tool ...... "
cp -rf mtk_openwrt_feeds/feed/app/regs/src meta-filogic/recipes-devtools/regs/files/

echo "Update mtk-factory-rw tool ...... "
cp -rf mtk_openwrt_feeds/feed/app/mtk_factory_rw/files/ meta-filogic/recipes-devtools/mtk-factory-rw/

echo "Update smp-m76 script"
cp -f  mtk_openwrt_feeds/feed/app/smp_util/files/*.sh meta-filogic/recipes-devtools/smp/files/

echo "Update ftnl tools"
cp -rf mtk_openwrt_feeds/feed/app/flowtable/src meta-filogic/recipes-devtools/flowtable/files/

echo "Update eth fw"
rm -rf meta-filogic/recipes-bsp/mediatek-eth-firmware/files/*
rm -rf meta-filogic/recipes-bsp/eth-firmware/files/*
cp -rf mtk_openwrt_feeds/feed/app/mt798x-2p5g-phy-firmware-internal/files/* meta-filogic/recipes-bsp/mediatek-eth-firmware/files/ 
cp -rf mtk_openwrt_feeds/autobuild/unified/global/common/files/package/kernel/aqr10g-phy-fw/files/* meta-filogic/recipes-bsp/eth-firmware/files/
cp -rf openwrt/package/kernel/as21xxx/firmware/* meta-filogic/recipes-bsp/eth-firmware/files/
cp -rf openwrt/package/kernel/airoha-phy-fw/files/* meta-filogic/recipes-bsp/eth-firmware/files/
echo "sync done..........."


#don't sync this kernl file,so remove it.it is download form logan repo
rm -rf meta-filogic/recipes-kernel/linux/linux-mediatek-5.4/mediatek/files-5.4/include/uapi/
#save sync mtk_openwrt_feeds log
cd mtk_openwrt_feeds/ && git log --oneline -n 200 > mtk_openwrt_feeds.log

echo "sync compelte..........."
exit 0