require ccsp_common_filogic.inc

FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append = " \
    file://cr-deviceprofile_filogic.xml \
"

do_install:append() {
    # Config files and scripts
    install -m 644 ${WORKDIR}/cr-deviceprofile_filogic.xml ${D}/usr/ccsp/cr-deviceprofile.xml
    install -m 644 ${WORKDIR}/cr-deviceprofile_filogic.xml ${D}/usr/ccsp/cr-ethwan-deviceprofile.xml
}

LDFLAGS:append_dunfell = " -lpthread -lbreakpadwrapper"
