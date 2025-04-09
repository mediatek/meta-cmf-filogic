EXTRA_OECONF += " \
		--without-pear  \
		"
do_install:prepend:pn-php () {
	install -d ${D}${sysconfdir}
        touch ${D}${sysconfdir}/pear.conf
}

do_install:append:pn-php () {
    rm ${D}${sysconfdir}/pear.conf
}
