SRC_URI:remove = "file://verbose.patch"
SRC_URI:remove = "file://revsshipv6.patch"
SYSTEMD_SERVICE:${PN}:remove:broadband = "dropbear.socket"

FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI:append:kirkstone = " file://rdkb-dropbear-extend-default-path.patch "

do_configure:prepend_hybrid () {
    export LIBS="${LIBS} -ltelemetry_msgsender"
}

do_configure:prepend_client () {
    export LIBS="${LIBS} -ltelemetry_msgsender"
}

do_configure:prepend_broadband () {
    export LIBS="${LIBS} -ltelemetry_msgsender"
}

do_install:append:broadband() {
  rm -rf ${D}${systemd_unitdir}
  rm -rf ${D}${libdir}
}
ERROR_QA:remove = "patch-fuzz patch-status"
INSANE_SKIP:${PN} += "installed-vs-shipped"