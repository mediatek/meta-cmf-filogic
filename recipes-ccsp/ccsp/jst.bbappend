LDFLAGS:aarch64 += " -Wl,--no-as-needed"

do_configure:prepend:aarch64 () {
	sed -i "s/format_s\[loop2-1\]=0\;/\/\/format_s\[loop2-1\]=0\;/g" ${S}/source/jst_cosa.c
}

do_install:append:aarch64 () {
    sed -i '/return \$arr.pop()/i  \$arr.pop();' ${D}/usr/www2/includes/php.jst
}
