require ccsp_common_filogic.inc

EXTRA_OECONF:append_dunfell  = " --with-ccsp-arch=arm"
CFLAGS:append_kirkstone = " -fcommon "
LDFLAGS:append = " -lnanomsg "

do_install:append() {
    if ${@bb.utils.contains('DISTRO_FEATURES', 'dhcp_manager', 'false', 'true', d)}; then
        rm -rf ${D}${systemd_unitdir}/
    fi
}
