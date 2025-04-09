RDEPENDS:packagegroup-rdk-ccsp-broadband:remove = "ccsp-moca"
RDEPENDS:packagegroup-rdk-ccsp-broadband:remove = "ccsp-moca-ccsp"
RDEPENDS:packagegroup-rdk-ccsp-broadband:remove = "sys-resource"
RDEPENDS:packagegroup-rdk-ccsp-broadband:remove = "ccsp-cm-agent-ccsp"
RDEPENDS:packagegroup-rdk-ccsp-broadband:remove = "ccsp-cm-agent"
RDEPENDS:packagegroup-rdk-ccsp-broadband:remove = "ccsp-mta-agent-ccsp"
RDEPENDS:packagegroup-rdk-ccsp-broadband:remove = "ccsp-mta-agent"
RDEPENDS:packagegroup-rdk-ccsp-broadband:remove = "ccsp-tr069-pa"
RDEPENDS:packagegroup-rdk-ccsp-broadband:remove = "ccsp-tr069-pa-ccsp"
RDEPENDS:packagegroup-rdk-ccsp-broadband:remove = "ccsp-epon-agent"
RDEPENDS:packagegroup-rdk-ccsp-broadband:remove = "ovs-agent"
RDEPENDS:packagegroup-rdk-ccsp-broadband:remove = "harvester"
#RDEPENDS:packagegroup-rdk-ccsp-broadband:remove = "ccsp-hotspot"
#RDEPENDS:packagegroup-rdk-ccsp-broadband:remove = "ccsp-hotspot-kmod"

#removing memstress for now following a build issue
RDEPENDS:packagegroup-rdk-ccsp-broadband:remove = "memstress"

#removing mesh-agent for now. will be brought back along with opensync
RDEPENDS:packagegroup-rdk-ccsp-broadband:remove = "mesh-agent"

RDEPENDS:packagegroup-rdk-ccsp-broadband:remove = "xupnp"

#removing wanmanager components for now following runtime issues
RDEPENDS:packagegroup-rdk-ccsp-broadband:remove = "rdktelcovoicemanager"
RDEPENDS:packagegroup-rdk-ccsp-broadband:append = " rdk-vlanmanager"
RDEPENDS:packagegroup-rdk-ccsp-broadband:remove = "rdk-ppp-manager"
RDEPENDS:packagegroup-rdk-ccsp-broadband:append = " rdk-fwupgrade-manager"

RDEPENDS:packagegroup-rdk-ccsp-broadband:append = "\
    rdk-logger \
    libseshat \
    start-parodus \
"
RDEPENDS:packagegroup-rdk-ccsp-broadband:remove_dunfell = "start-parodus"

#TODO: need to revisit if it breaks functionality. removing since it depends on ucresolv
RDEPENDS:packagegroup-rdk-ccsp-broadband:remove = "parodus"
RDEPENDS:packagegroup-rdk-ccsp-broadband:remove = "parodus2ccsp"

RDEPENDS:packagegroup-rdk-ccsp-broadband:append = " ${@bb.utils.contains('DISTRO_FEATURES', 'rdkb_wan_manager', ' rdk-wanmanager ', '', d)} "

GWPROVAPP = ""

