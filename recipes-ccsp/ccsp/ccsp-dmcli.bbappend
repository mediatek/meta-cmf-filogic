require ccsp_common_filogic.inc

LDFLAGS:append_dunfell = " -lsafec-3.5.1"

do_install:append () {
    ln -sf ${bindir}/dmcli ${D}${bindir}/ccsp_bus_client_tool
}
