FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += " \
	    file://timeout.cfg \
            file://rdkb.cfg \
           "

do_install:append:kirkstone() {
	rm ${D}${sysconfdir}/syslog.conf
}

FILES:${PN}-syslog:remove:kirkstone = "${sysconfdir}/syslog.conf"

ERROR_QA:remove = "patch-fuzz"
WARN_QA:append = " patch-fuzz"
