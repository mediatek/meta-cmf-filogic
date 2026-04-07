require ccsp_common_filogic.inc

EXTRA_OECONF:append_dunfell  = " --with-ccsp-arch=arm"
CFLAGS:append_kirkstone = " -fcommon "
LDFLAGS:append = " -lnanomsg "
CFLAGS_append  += " ${@bb.utils.contains('DISTRO_FEATURES', 'dhcp_manager', '-DFEATURE_RDKB_DHCP_MANAGER', '', d)}"
CFLAGS_append  = " ${@bb.utils.contains('DISTRO_FEATURES', 'rdkb_wan_manager', '-DFEATURE_RDKB_WAN_MANAGER', '', d)}"
do_install:append() {
    if ${@bb.utils.contains('DISTRO_FEATURES', 'dhcp_manager', 'false', 'true', d)}; then
        rm -rf ${D}${systemd_unitdir}/
    fi
}
