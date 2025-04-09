FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
SRC_URI += "file://wpa_supplicant-global.service"

SYSTEMD_SERVICE:${PN} = "wpa_supplicant-global.service"
SYSTEMD_AUTO_ENABLE:${PN} = "enable"

do_install:append () {
   install -m 0644 ${WORKDIR}/wpa_supplicant-global.service ${D}${systemd_unitdir}/system/
}

