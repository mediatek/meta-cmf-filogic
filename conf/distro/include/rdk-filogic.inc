
DISTRO_FEATURES:append = " rdk-oss-ssa"
DISTRO_FEATURES:remove_dunfell = "telemetry2_0"

# RDKBDEV-73 : Dynamic DNS : Standardization based on broadband-forum.
DISTRO_FEATURES:append = " ddns_broadband"

# RDKBDEV-83 : Device Gateway Association using Managed Device
DISTRO_FEATURES:append = " device_gateway_association"

# RDKBDEV-50: Adding DSLite Functionality and related TR-181 DataModel Parameters
DISTRO_FEATURES:append = " dslite"

# REFPLTV-1137: DLNA support for xupnp
DISTRO_FEATURES:append = " dlna"

DISTRO_FEATURES:append = " webconfig_bin"

# RDKB-44824: CoreNetLib move bb file location
DISTRO_FEATURES:append = " core-net-lib"

# RDKB-48800: Install DHCP Manager service file
DISTRO_FEATURES:append_broadband = " dhcp_manager"

# Fix MeshAgent build errors
DISTRO_FEATURES:append_broadband = " WanFailOverSupportEnable"

DISTRO_FEATURES:append_kirkstone = " kirkstone"
DISTRO_FEATURES_NATIVE:append_kirkstone = " kirkstone"

DISTRO_FEATURES:append = " meshwifi"
DISTRO_FEATURES:append = " ipv6"
DISTRO_FEATURES:append = " rdkb_wan_manager"
DISTRO_FEATURES:append = " filogic"
#DISTRO_FEATURES:append = " easymesh-controller"
#DISTRO_FEATURES:append = " emmc"
#DISTRO_FEATURES:append = " samba"
DISTRO_FEATURES:append = " three_gmac"
HOSTTOOLS += " python"
DISTRO_FEATURES_append = " rdkb_configurable_wan_interface"
#Disable rdm-agent for reference platform
DISTRO_FEATURES_append = " RDM"
DISTRO_FEATURES_append = " rrd"

