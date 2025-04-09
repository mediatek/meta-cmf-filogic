FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append = " \
    file://001-fix-64bit-build-error.patch;apply=no \
    file://002-change-scan-interface-name-prefix.patch;apply=no \
"

do_filogic_patches() {
    cd ${S}
    if [ ! -e patch_applied ]; then
        for i in ${WORKDIR}/*.patch; do patch -p1 < $i; done
        touch patch_applied
    fi
}
addtask filogic_patches after do_unpack before do_configure

do_install:append () {
    install -d ${D}${systemd_unitdir}/system
    install -D -m 0644 ${S}/scripts/RdkEasyMeshController.service ${D}${systemd_unitdir}/system/RdkEasyMeshController.service
}

SYSTEMD_SERVICE:${PN} += "RdkEasyMeshController.service"
FILES:${PN}:append += "${systemd_unitdir}/system/RdkEasyMeshController.service"


