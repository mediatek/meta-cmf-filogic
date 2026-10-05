FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI += "file://dnsmasq.conf"

ERROR_QA:remove = "patch-fuzz"
WARN_QA:append = " patch-fuzz"