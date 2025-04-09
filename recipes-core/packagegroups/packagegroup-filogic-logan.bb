SUMMARY = "MediaTek Proprietary wifi driver logan package group for filogic boards"

LICENSE = "MIT"

inherit packagegroup

DEPENDS = "libnl"

PACKAGES = " \
	  packagegroup-filogic-logan \
	"

RDEPENDS:packagegroup-filogic-logan = " \
    packagegroup-core-boot \
    wireless-tools \
    linux-mac80211 \
    hostapd \
    wpa-supplicant \
    wireless-regdb-static \
    ubus  \
    ubusd \
    uci \
    lua \
    datconf \
    iwinfo \
    iw \
    ${@bb.utils.contains('DISTRO_FEATURES', 'ccn34', '', 'warp', d)} \
    mt-wifi7 \
    mt-hwifi \
    ${@bb.utils.contains('DISTRO_FEATURES', 'mt7993-be3600', 'mt-wifi-osal', 'mt-wifi-cmn', d)} \
    mtfwd \
    logan-insmod \
    mwctl \
    ated-ext \
	sigma-daemon \
    switch \
    luasocket \
    syslog-ng \
	mtqos \
    ${@bb.utils.contains('DISTRO_FEATURES', 'ccn34', 'ioctl-test', '', d)} \
    ${@bb.utils.contains('DISTRO_FEATURES', 'ccn34', 'pce', '', d)} \
    ${@bb.utils.contains('DISTRO_FEATURES', 'ccn34', 'pce-insmod', '', d)} \
    ${@bb.utils.contains('DISTRO_FEATURES', 'ccn34', 'iap-test', '', d)} \
    ${@bb.utils.contains('DISTRO_FEATURES', 'ccn34', 'tops', '', d)} \
    ${@bb.utils.contains('DISTRO_FEATURES', 'ccn34', 'tops-insmod', '', d)} \
    ${@bb.utils.contains('DISTRO_FEATURES', 'eip-197-inline', 'eip-197', '', d)} \
    ${@bb.utils.contains('DISTRO_FEATURES', 'eip-197-inline', 'eip-197-insmod', '', d)} \
    ${@bb.utils.contains('DISTRO_FEATURES', 'ccn34', 'crypto-safexcel', '', d)} \
    ${@bb.utils.contains('DISTRO_FEATURES', 'ccn34', 'safexcel-insmod', '', d)} \
    ${@bb.utils.contains('DISTRO_FEATURES', 'ccn34', 'dummy-clickos', '', d)} \
    ${@bb.utils.contains('DISTRO_FEATURES', 'scnrdo', 'mt-wifi-ce-mt7902', '', d)} \
    ${@bb.utils.contains('DISTRO_FEATURES', 'scnrdo', 'scan-radio-insmod', '', d)} \
    ${@bb.utils.contains('DISTRO_FEATURES', 'ccn34', 'dummy-clickos-insmod', '', d)} \
    "
