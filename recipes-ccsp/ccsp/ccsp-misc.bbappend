require ccsp_common_filogic.inc

DEPENDS:append_dunfell = " ccsp-lm-lite"

LDFLAGS:append_dunfell = " -lsafec-3.5.1"

EXTRA_OECONF:append_dunfell  = " --with-ccsp-arch=arm"

CFLAGS += " -DDHCPV4_CLIENT_UDHCPC -DDHCPV6_CLIENT_DIBBLER "
