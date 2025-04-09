FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
SRC_URI:append_camera = " \
        file://wpa_supplicant.service \
        file://wpa_supplicant.conf \
"
SRC_URI:append_hybrid = " \
        file://wpa_supplicant.service \
        file://configure_wpa_supplicant.sh \
"
SRC_URI:append_client = " \
        file://wpa_supplicant.service \
        file://configure_wpa_supplicant.sh \
"
SRC_URI:append_extender = " file://wpa_supplicant-global.service"

EXTRA_OEMAKE = "CONFIG_BUILD_WPA_CLIENT_SO=y"
FILES_SOLIBSDEV = ""
do_install:append () {
	install -d ${D}${includedir}
	install -d ${D}${libdir}
	install -d ${D}/lib/rdk/

	install -m 0777 ${S}/wpa_supplicant/libwpa_client.so  ${D}${libdir}/
	install -m 0644 ${S}/src/common/wpa_ctrl.h ${D}${includedir}/
}

do_install:append_camera() {
        install -D -m 0644 ${WORKDIR}/wpa_supplicant.service ${D}/lib/systemd/system/wpa_supplicant.service
        install -D -m 0644 ${WORKDIR}/wpa_supplicant.conf ${D}/etc/wpa_supplicant.conf
}
do_install:append_hybrid() {
        install -D -m 0644 ${WORKDIR}/wpa_supplicant.service ${D}/lib/systemd/system/wpa_supplicant.service
        install -D -m 0755 ${WORKDIR}/configure_wpa_supplicant.sh ${D}/lib/rdk/
}
do_install:append_client() {
        install -D -m 0644 ${WORKDIR}/wpa_supplicant.service ${D}/lib/systemd/system/wpa_supplicant.service
        install -D -m 0755 ${WORKDIR}/configure_wpa_supplicant.sh ${D}/lib/rdk/
}

do_install:append_extender () {
        install -m 0755 ${WORKDIR}/wpa_supplicant-global.service ${D}${systemd_unitdir}/system/
}

FILES:${PN} += "${libdir}/libwpa_client.so"
FILES:${PN} += "${includedir}/wpa_ctrl.h"

FILES:${PN}:append_camera = " \
  ${systemd_unitdir}/system/wpa_supplicant.service \
  ${sysconfdir}/wpa_supplicant.conf \
"
FILES:${PN}:append_hybrid = " \
  ${systemd_unitdir}/system/wpa_supplicant.service \
  /lib/rdk/configure_wpa_supplicant.sh \
"
FILES:${PN}:append_client = " \
  ${systemd_unitdir}/system/wpa_supplicant.service \
  /lib/rdk/configure_wpa_supplicant.sh \
"

inherit systemd
SYSTEMD_SERVICE:${PN}_camera = "wpa_supplicant.service"
SYSTEMD_AUTO_ENABLE:camera = "enable"
FILES:${PN}:append_camera += "${systemd_unitdir}/system/*"

SYSTEMD_SERVICE:${PN}_hybrid = "wpa_supplicant.service"
SYSTEMD_AUTO_ENABLE:hybrid = "enable"
FILES:${PN}:append_hybrid += "${systemd_unitdir}/system/*"

SYSTEMD_SERVICE:${PN}_client = "wpa_supplicant.service"
SYSTEMD_AUTO_ENABLE:client = "enable"
FILES:${PN}:append_client += "${systemd_unitdir}/system/*"

SYSTEMD_SERVICE:${PN}_extender = "wpa_supplicant-global.service"
SYSTEMD_AUTO_ENABLE:${PN}_extender = "enable"

