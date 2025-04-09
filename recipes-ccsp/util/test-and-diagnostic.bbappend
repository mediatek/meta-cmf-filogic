require recipes-ccsp/ccsp/ccsp_common_filogic.inc

do_install:append () {
    # Test and Diagonastics XML 
       install -m 644 ${S}/config/TestAndDiagnostic_arm.XML ${D}/usr/ccsp/tad/TestAndDiagnostic.XML
       install -m 644 ${S}/scripts/selfheal_reset_counts.sh ${D}/usr/ccsp/tad/selfheal_reset_counts.sh
       install -m 0755 ${S}/scripts/selfheal_aggressive.sh ${D}/usr/ccsp/tad
}

EXTRA_OECONF:append_dunfell  = " --with-ccsp-arch=arm"

FILES:${PN}-ccsp += " \
                    ${prefix}/ccsp/tad/* \
                    /fss/gw/usr/ccsp/tad/* \
                    "