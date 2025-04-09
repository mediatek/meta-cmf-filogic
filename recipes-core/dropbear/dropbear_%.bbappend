SRC_URI:remove = "file://verbose.patch"
SRC_URI:remove = "file://revsshipv6.patch"
SYSTEMD_SERVICE:${PN}:remove_broadband = "dropbear.socket"

FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI:append = " file://rdkb-dropbear-extend-default-path.patch "

do_configure:prepend_hybrid () {
    export LIBS="${LIBS} -ltelemetry_msgsender"
}

do_configure:prepend_client () {
    export LIBS="${LIBS} -ltelemetry_msgsender"
}

do_configure:prepend_broadband () {
    export LIBS="${LIBS} -ltelemetry_msgsender"
}

do_install:append_broadband() {
  rm -rf ${D}${systemd_unitdir}
  rm -rf ${D}/lib
}
