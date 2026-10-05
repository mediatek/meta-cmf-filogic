FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI += " \
    file://lighttpd_php.conf.broadband \
    file://lighttpd_jst.conf.broadband \
"

SYSTEMD_SERVICE:${PN} += "lighttpd.service"

do_install:append() {
    install -d ${D}${sysconfdir}
    if [ "${@bb.utils.contains("DISTRO_FEATURES", "webui_jst", "yes", "no", d)}" = "yes" ]; then
       install -m 0644 ${UNPACKDIR}/lighttpd_jst.conf.broadband ${D}${sysconfdir}/lighttpd.conf
    else       
       install -m 0644 ${UNPACKDIR}/lighttpd_php.conf.broadband ${D}${sysconfdir}/lighttpd.conf
    fi
}

FILES:${PN}:append_morty = " /usr/lib/mod_fastcgi.so"

RDEPENDS:${PN}:append = " \
    lighttpd-module-proxy \
    " 
