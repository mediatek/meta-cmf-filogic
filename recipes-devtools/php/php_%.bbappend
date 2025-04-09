EXTRA_OECONF:append = " --enable-cgi "

CFLAGS:append = " -DHAVE_LIBDL "
LDFLAGS:append = " -ldl "
