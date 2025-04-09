DEPENDS:remove = "virtual/kernel bridge-utils"
DEPENDS:append:class-target = " virtual/kernel"
DEPENDS:append:class-target = " bridge-utils"


EXTRA_OECONF += "--enable-ssl"

#disable openvswitch autostart
SYSTEMD_SERVICE:${PN}-switch = ""

PACKAGECONFIG[ssl] = " "