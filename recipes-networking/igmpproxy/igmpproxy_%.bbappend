FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI:append = "file://igmpproxy.conf \
				 "

do_install:append () {
    install -p ${S}/../igmpproxy.conf ${D}/etc/
}

FILES:${PN} += "/etc/*"
