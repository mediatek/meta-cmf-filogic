EXTRA_OECONF += " --enable-obsolete-rpc" 

#avoiding the conflicts with libnsl2
do_install:append() {
rm -rf ${D}/usr/include/rpcsvc
}

# provided by libnsl2
do_install:append:class-nativesdk() {
    rm -f ${D}${includedir}/rpcsvc/yppasswd.*
}
