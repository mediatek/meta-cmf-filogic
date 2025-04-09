LDFLAGS:aarch64 += " -lutctx -lprivilege "
EXTRA_OECONF:remove_kirkstone  = " --with-ccsp-platform=bcm --with-ccsp-arch=arm "

DEPENDS:append += " libsyswrapper breakpad-wrapper"
LDFLAGS:append += " -lsecure_wrapper -lbreakpadwrapper"