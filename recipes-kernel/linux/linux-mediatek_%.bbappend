do_install:append() {
    cp -Rfp ${B}/scripts/ ${STAGING_KERNEL_BUILDDIR}/
    install -d ${D}${includedir}
    install -m 0644 ${B}/include/generated/autoconf.h ${D}${includedir}/autoconf.h
}

sysroot_stage_all:append () {
    install -d ${SYSROOT_DESTDIR}${includedir}
    install -m 0644 ${D}${includedir}/autoconf.h ${SYSROOT_DESTDIR}${includedir}/autoconf.h
}


PACKAGES += "kernel-autoconf"
PROVIDES += "kernel-autoconf"

FILES:kernel-autoconf = "${includedir}/autoconf.h"
