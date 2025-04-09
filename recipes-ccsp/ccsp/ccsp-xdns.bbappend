require ccsp_common_filogic.inc

EXTRA_OECONF:append_dunfell  = " --with-ccsp-arch=arm"

LDFLAGS:append_dunfell = " -lsafec-3.5.1"
