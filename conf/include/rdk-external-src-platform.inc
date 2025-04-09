# Note: This feature is for developers ONLY.
# Please do not forget to set BB_ENV_PASSTHROUGH_ADDITIONS before
# launching the yocto build.
# `export BB_ENV_PASSTHROUGH_ADDITIONS="${BB_ENV_PASSTHROUGH_ADDITIONS} RDK_ROOT_PATH"`
#
INHERIT += "externalsrc"

EXTERNALSRC:pn-hal-dhcpv4c-generic = "${@'${RDK_ROOT_PATH}/rdkb/components/opensource/ccsp/hal/source/dhcpv4c' if (os.path.isdir('${RDK_ROOT_PATH}/rdkb/components/opensource/ccsp/hal/source/dhcpv4c/rdkb_hal')) else ''}"
EXTERNALSRC:pn-hal-ethsw-generic = "${@'${RDK_ROOT_PATH}/rdkb/components/opensource/ccsp/hal/source/ethsw' if (os.path.isdir('${RDK_ROOT_PATH}/rdkb/components/opensource/ccsp/hal/source/ethsw/rdkb_hal')) else ''}"
EXTERNALSRC:pn-hal-platform-generic = "${@'${RDK_ROOT_PATH}/rdkb/components/opensource/ccsp/hal/source/platform' if (os.path.isdir('${RDK_ROOT_PATH}/rdkb/components/opensource/ccsp/hal/source/platform/rdkb_hal')) else ''}"
#EXTERNALSRC:pn-hal-wifi-turris = "${@'${RDK_ROOT_PATH}/rdkb/devices/turris/hal/source/wifi' if (os.path.isdir('${RDK_ROOT_PATH}/rdkb/devices/turris/hal')) else ''}"
