FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += " \
	    file://timeout.cfg \
            file://rdkb.cfg \
           "

do_install:append() {
	rm ${D}${sysconfdir}/syslog.conf
}

FILES:${PN}-syslog:remove = "${sysconfdir}/syslog.conf"

