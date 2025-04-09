require ccsp_common_filogic.inc

EXTRA_OECONF:append_dunfell  = " --with-ccsp-arch=arm"

LDFLAGS:append = " -Wl,--no-as-needed"

