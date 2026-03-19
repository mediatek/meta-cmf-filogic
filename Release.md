# Mediatek Upstream SoftMAC WiFi Driver - MT76 Release Note (RDK-B)

## Compile Environment Requirement

- for kernel 5.4: Use Ubuntu 18.04
- for kernel 6.6/6.12: Use Ubuntu 22.04

---

## Latest Release Version

#### Filogic 880/850 WiFi7 Kernel6.12 MLO MP4.3 Release (20260327)

##### External Release

```
#Get  latest RDKB core release  : https://wiki.rdkcentral.com/display/CMF/RDK-B+Code+Releases

kirkstone : repo init -u https://code.rdkcentral.com/r/rdkcmf/manifests  -b rdkb-2025q4-kirkstone -m rdkb-nosrc.xml

repo sync -j `nproc` --no-clone-bundle --no-tags

#Get filogic BSP meta layer
git clone https://git01.mediatek.com/filogic/rdk-b/meta-filogic
cd meta-filogic; git checkout 77e17792f60279b6e1deb1f1c6abf5705972bc6f; cd -;

#Get filogic Adapter cmf layer
git clone https://git01.mediatek.com/filogic/rdk-b/meta-cmf-filogic
cd meta-cmf-filogic; git checkout a68043b58a049ee5a93f3509c1f268fea73cc388; cd -;

#Choose one platform to build
#Filogic880
MACHINE=filogic880-kerenl6-12 source meta-cmf-filogic/setup-environment-release && bitbake rdk-generic-broadband-image

#Bpi-r4
MACHINE=filogic880-kernel6-12-bpi-r4 source meta-cmf-filogic/setup-environment-release && bitbake rdk-generic-broadband-image

#Filogic850
MACHINE=filogic850-kerenl6-12 source meta-cmf-filogic/setup-environment-release && bitbake rdk-generic-broadband-image
```

##### WiFi Package Version

refer to https://git01.mediatek.com/plugins/gitiles/openwrt/feeds/mtk-openwrt-feeds/+/refs/heads/master/autobuild/unified/Readme-6.12.md#wi_fi-7-latest-release-version-filogic-880_850-wifi7-4_3-formal-release-2026_03_13-wifi-package-version

#### Filogic 880/860 WiFi7 Kernel6.6 MLO MP4.2 Release (20250926)

##### External Release

```
#Get  latest RDKB core release  : https://wiki.rdkcentral.com/display/CMF/RDK-B+Code+Releases

kirkstone : repo init -u https://code.rdkcentral.com/r/rdkcmf/manifests  -b rdkb-2025q2-kirkstone -m rdkb-nosrc.xml

repo sync -j `nproc` --no-clone-bundle --no-tags

#Get filogic BSP meta layer
git clone https://git01.mediatek.com/filogic/rdk-b/meta-filogic
cd meta-filogic; git checkout c67a32a7c8876b328a8d1eeaca213e860d85b3ce; cd -;

#Get filogic Adapter cmf layer
git clone https://git01.mediatek.com/filogic/rdk-b/meta-cmf-filogic
cd meta-cmf-filogic; git checkout 211fa3d81ae19cc5c6be731d52b1aa6733336b71; cd -;

#Choose one platform to build
#Filogic880
MACHINE=filogic880-kerenl6-6 source meta-cmf-filogic/setup-environment-release && bitbake rdk-generic-broadband-image

#Bpi-r4
MACHINE=filogic880-kernel6-6-bpi-r4 source meta-cmf-filogic/setup-environment-release && bitbake rdk-generic-broadband-image

#Filogic850
MACHINE=filogic850-kerenl6-6 source meta-cmf-filogic/setup-environment-release && bitbake rdk-generic-broadband-image
```

##### WiFi Package Version

refer to https://git01.mediatek.com/plugins/gitiles/openwrt/feeds/mtk-openwrt-feeds/+/refs/heads/master/autobuild/unified/#wi_fi-7-latest-release-version-filogic-880_860_850-wifi7-mp4_2-release-2025_09_12-wifi-package-version

#### Filogic 880/860 WiFi7 Kernel6.6 MLO MP4.1 Release (20250509)

##### External Release

```
#Get  latest RDKB core release  : https://wiki.rdkcentral.com/display/CMF/RDK-B+Code+Releases

kirkstone : repo init -u https://code.rdkcentral.com/r/rdkcmf/manifests  -b rdkb-2025q1-kirkstone -m rdkb-nosrc.xml

repo sync -j `nproc` --no-clone-bundle --no-tags

#Get filogic BSP meta layer
git clone https://git01.mediatek.com/filogic/rdk-b/meta-filogic
cd meta-filogic; git checkout c156817e117323d8c92b189c2f15a28962cb8f5c; cd -;

#Get filogic Adapter cmf layer
git clone https://git01.mediatek.com/filogic/rdk-b/meta-cmf-filogic
cd meta-cmf-filogic; git checkout 1b4b8718711146067f8ad438cfaac16552806944; cd -;

#Choose one platform to build
#Filogic880
MACHINE=filogic880-kerenl6-6 source meta-cmf-filogic/setup-environment-release && bitbake rdk-generic-broadband-image

#Bpi-r4
MACHINE=filogic880-kernel6-6-bpi-r4 source meta-cmf-filogic/setup-environment-release && bitbake rdk-generic-broadband-image
```

##### WiFi Package Version

refer to https://git01.mediatek.com/plugins/gitiles/openwrt/feeds/mtk-openwrt-feeds/+/refs/heads/master/autobuild/unified/#wi_fi-7-latest-release-version-filogic-880_860-wifi7-mp4_1-release-2025_04_25-wifi-package-version

#### Filogic 880/860 WiFi7 MLO MP Release (20250110)

##### External Release

```
#Get  latest RDKB core release  : https://wiki.rdkcentral.com/display/CMF/RDK-B+Code+Releases

kirkstone : repo init -u https://code.rdkcentral.com/r/rdkcmf/manifests  -b rdkb-2024q4-kirkstone -m rdkb-nosrc.xml

repo sync -j `nproc` --no-clone-bundle --no-tags

#Get filogic BSP meta layer
git clone https://git01.mediatek.com/filogic/rdk-b/meta-filogic
cd meta-filogic; git checkout 4d1a2a549791f1d57c83d8be89927aed647b62ea; cd -;

#Get filogic Adapter cmf layer
git clone https://git01.mediatek.com/filogic/rdk-b/meta-cmf-filogic
cd meta-cmf-filogic; git checkout 39973f0b37b6afef2be10640bedd9efb359530df; cd -;

#Choose one platform to build
#Filogic880
MACHINE=filogic880 source meta-cmf-filogic/setup-environment-release && bitbake rdk-generic-broadband-image

#Bpi-r4
MACHINE=filogic880-bpi-r4 source meta-cmf-filogic/setup-environment-release && bitbake rdk-generic-broadband-image
```

##### WiFi Package Version

refer to https://git01.mediatek.com/plugins/gitiles/openwrt/feeds/mtk-openwrt-feeds/+/refs/heads/master/autobuild/autobuild_5.4_mac80211_release/Readme.md#wi_fi-7-latest-release-version-filogic-880_860-wifi7-kernel5_4-mp4_0-release-wifi-package-version

#### Filogic 880/860 WiFi7 MLO Beta Release (20240826)

##### External Release

```
#Get  latest RDKB core release  : https://wiki.rdkcentral.com/display/CMF/RDK-B+Code+Releases

kirkstone : repo init -u https://code.rdkcentral.com/r/rdkcmf/manifests  -b rdkb-2024q2-kirkstone -m rdkb-nosrc.xml

repo sync -j `nproc` --no-clone-bundle --no-tags

#Get filogic BSP meta layer
git clone https://git01.mediatek.com/filogic/rdk-b/meta-filogic
cd meta-filogic; git checkout f51b4c5f632ab59eac9cecf69fabc98678f29218; cd -;

#Get filogic Adapter cmf layer
git clone https://git01.mediatek.com/filogic/rdk-b/meta-cmf-filogic
cd meta-cmf-filogic; git checkout 7a8894c145ae8f31e345d86258266ce7bb129dda; cd -;

#Choose one platform to build
#Filogic880
MACHINE=filogic880 source meta-cmf-filogic/setup-environment-release && bitbake rdk-generic-broadband-image

#Bpi-r4
MACHINE=filogic880-bpi-r4 source meta-cmf-filogic/setup-environment-release && bitbake rdk-generic-broadband-image
```

##### WiFi Package Version

refer to https://git01.mediatek.com/plugins/gitiles/openwrt/feeds/mtk-openwrt-feeds/+/refs/heads/master/autobuild/autobuild_5.4_mac80211_release/Release.md#wi_fi-7-latest-release-version



#### Filogic 830/820/630/615 WiFi6 MP2.3 Release (20240514)

```
#Get  latest RDKB core release  : https://wiki.rdkcentral.com/display/CMF/RDK-B+Code+Releases

dunfell : repo init -u https://code.rdkcentral.com/r/rdkcmf/manifests  -b rdkb-2024q1-dunfell -m rdkb-nosrc.xml

kirkstone : repo init -u https://code.rdkcentral.com/r/rdkcmf/manifests  -b rdkb-2024q1-kirkstone -m rdkb-nosrc.xml

repo sync -j `nproc` --no-clone-bundle --no-tags

#Get filogic BSP meta layer
git clone https://git01.mediatek.com/filogic/rdk-b/meta-filogic
cd meta-filogic; git checkout 5c8e7ef29bd1801c75126c10f67e1d0d1cac7485; cd -;

#Get filogic Adapter cmf layer
git clone https://git01.mediatek.com/filogic/rdk-b/meta-cmf-filogic
cd meta-cmf-filogic; git checkout ab57bb162d5e3009f09c49092ce3b88790dd0669; cd -;

#Choose one platform to build
#Filogic830
MACHINE=filogic830 source meta-cmf-filogic/setup-environment-release && bitbake rdk-generic-broadband-image

```

##### WiFi Package Version

refer to https://git01.mediatek.com/plugins/gitiles/openwrt/feeds/mtk-openwrt-feeds/+/refs/heads/master/autobuild_mac80211_release/Release.md#filogic-830_820_630_615-wifi6-mp2_3-release-20240510

---


