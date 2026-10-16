BBMASK .= "|meta-rdk/recipes-common/rdkversion/"
BBMASK .= "|meta-cmf/recipes-common/rdkversion/"
BBMASK .= "|meta-cmf/recipes-support/libdacjwt/"
BBMASK .= "|meta-cmf/recipes-support/libkwk-rdk/"
BBMASK .= "|meta-cmf/recipes-support/libmntfsimg/"
BBMASK .= "|meta-cmf/recipes-common/webconfig-framework/"
BBMASK .= "|meta-rdk/recipes-core/packagegroups/packagegroup-rdk-media-common.bb"
BBMASK .= "|meta-rdk/recipes-support/base64/base64_git.bb"

BBMASK .= "|meta-rdk-ext/recipes-common/rtmessage"
BBMASK .= "|meta-rdk-ext/recipes-kernel/linux/linux-libc-headers_%.bbappend"
BBMASK .= "|meta-rdk-ext/recipes-kernel/linux/linux-libc-headers_3.14.bb"

BBMASK .= "|meta-rdk-ext/recipes-connectivity/wpa-supplicant/wpa-supplicant_%.bbappend"

BBMASK .= "|meta-browser/*"
BBMASK .= "|openembedded-core/meta/recipes-bsp/u-boot/libubootenv_0.2.bb"

BBMASK .= "|meta-virtualization/recipes-devtools/protobuf"

BBMASK .= "${@'' if os.path.isdir('|meta-openembedded/meta-oe/recipes-devtools/breakpad/breakpad_git.bb') else '|meta-cmf/recipes-devtools/breakpad/breakpad_git.bb'}"

#To avoid build warning
BBMASK .= "|meta-rdk-ext/recipes-support/iksemel/iksemel_1.5.bb"
BBMASK .= "|meta-cmf-broadband/recipes-core/util-linux/"
BBMASK .= "|meta-cmf/recipes-extended/smartmon/"
BBMASK .= "|meta-rdk/recipes-common/rtremote/"
BBMASK:dunfell .= "|meta-filogic/recipes-kernel/linux-libc-headers/"
BBMASK:dunfell .= "|meta-filogic/recipes-wifi/lua/"

# Make change for Wrynose build
BBMASK .= "|meta-openembedded/meta-oe/recipes-extended/ostree/"
#IMAGE_CLASSES:remove = 'apparmor_binprofiles'
BBMASK .= "|meta-rdk-oss-reference/recipes-gplv2/tar/tar_1.17.bb"
BBMASK .= "|meta-rdk-oss-reference/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb"
BBMASK .= "|meta-rdk-oss-reference-bck/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb"
BBMASK .= "|meta-rdk-oss-reference/recipes-connectivity/wpa-supplicant/wpa-supplicant_%.bbappend"
BBMASK .= "|openembedded-core/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb"
BBMASK .= "|openembedded-core/meta/recipes-connectivity/iw/iw_6.17.bb"
INCOMPATIBLE_LICENSE_EXCEPTIONS += "${MLPREFIX}tar:GPL-3.0-only ${MLPREFIX}tar-native:GPL-3.0-only ${MLPREFIX}elfutils:GPL-3.0-or-later"
INCOMPATIBLE_LICENSE_EXCEPTIONS += "${MLPREFIX}elfutils-src:GPL-3.0-or-later ${MLPREFIX}elfutils-binutils:GPL-3.0-or-later ${MLPREFIX}elfutils-dbg:GPL-3.0-or-later"
INCOMPATIBLE_LICENSE_EXCEPTIONS += "${MLPREFIX}elfutils-staticdev:GPL-3.0-or-later ${MLPREFIX}elfutils-dev:GPL-3.0-or-later ${MLPREFIX}elfutils-doc:GPL-3.0-or-later"
INCOMPATIBLE_LICENSE_EXCEPTIONS += "${MLPREFIX}elfutils-locale:GPL-3.0-or-later"


BBMASK .= "|meta-filogic/recipes-wifi/openssl/openssl_1.1.1%.bbappend"
BBMASK .= "|meta-cmf-filogic/recipes-common/heaptrack/heaptrack_1.0.0.bbappend"
BBMASK .= "|meta-cmf-filogic/recipes-connectivity/opensync/opensync_%.bbappend"
BBMASK .= "|meta-cmf-filogic/recipes-connectivity/opensync/opensync_git.bbappend"
BBMASK .= "|meta-cmf-filogic/recipes-core/glibc/glibc_2.31.bbappend"
BBMASK .= "|meta-cmf-filogic/recipes-core/systemd/systemd_244.%.bbappend"
BBMASK .= "|meta-cmf-filogic/recipes-devtools/php/php_7.%.bbappend"
BBMASK .= "|meta-cmf-filogic/recipes-devtools/python/python3-pycparser_2.20.bbappend"
BBMASK .= "${@bb.utils.contains('DISTRO_FEATURES', 'wrynose', '|meta-filogic/recipes-bsp/u-boot/u-boot-tools_2022.01.bbappend', '', d)}"
BBMASK .= "${@bb.utils.contains('DISTRO_FEATURES', 'wrynose', '|meta-cmf-filogic/recipes-connectivity/ppp/ppp_2.4.8.bbappend', '', d)}"
BBMASK .= "${@bb.utils.contains('DISTRO_FEATURES', 'wrynose', '|meta-filogic-onewifi/recipes-extended/iptables/iptables_1.8.7.bbappend', '', d)}"
BBMASK .= "${@bb.utils.contains('DISTRO_FEATURES', 'wrynose', '|meta-filogic-onewifi/recipes-connectivity/wpa-supplicant/wpa-supplicant_%.bbappend', '', d)}"
BBMASK .= "${@bb.utils.contains('DISTRO_FEATURES', 'wrynose', '|meta-filogic-onewifi/recipes-support/webcfg/webcfg_1.0.bbappend', '', d)}"
BBMASK .= "${@bb.utils.contains_any('DISTRO_FEATURES', 'em_extender wrynose', '', '|meta-rdk-ext/recipes-connectivity/bluez',d)}"
BBMASK .= "${@bb.utils.contains_any('DISTRO_FEATURES', 'em_extender wrynose', '', '|meta-rdk-ext/recipes-connectivity/bluez5',d)}"
BBMASK .= "${@bb.utils.contains_any('DISTRO_FEATURES', 'em_extender wrynose', '', '|openembedded-core/meta/recipes-connectivity/bluez5',d)}"
