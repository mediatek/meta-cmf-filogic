DEPENDS:remove = "virtual/crypt"
DEPENDS:append = " nanomsg"
DEPENDS:append_broadband = " libxcrypt"

SRC_URI:remove = "${@bb.utils.contains('DISTRO_FEATURES', 'rdkb_xdsl_ppp_manager', ' ', 'file://ipc-event.patch', d)}"
SRC_URI:remove = "${@bb.utils.contains('DISTRO_FEATURES', 'rdkb_xdsl_ppp_manager', ' ', 'file://ppp-remote-local-samelinklocaladdresses-fix.patch', d)}"
SRC_URI:remove = "${@bb.utils.contains('DISTRO_FEATURES', 'rdkb_xdsl_ppp_manager', ' ', 'file://ppp-sessionBW-authProtocol-ACName-LastConnErr-DM-Impl.patch', d)}"
SRC_URI:remove = "${@bb.utils.contains('DISTRO_FEATURES', 'rdkb_xdsl_ppp_manager', ' ', 'file://ppp-support-for-vendor-LCP-req-or-connection-update.patch', d)}"