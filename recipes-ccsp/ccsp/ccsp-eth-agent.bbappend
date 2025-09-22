require ccsp_common_filogic.inc

FILESEXTRAPATHS:append := "${THISDIR}/files:"

SRC_URI:append += " \
    file://Fix-ccsp-eth-agent-build-error.patch;apply=no \
"

CFLAGS_remove = "-DFEATURE_SUPPORT_ONBOARD_LOGGING "
do_filogic_patches() {
    cd ${S}

    if [ ! -e filogic_patch_applied ] && ([ "${PROJECT_BRANCH}" = "rdkb-2024q1-dunfell" ] || [ "${PROJECT_BRANCH}" = "rdkb-2024q1-kirkstone" ]); then
        patch -p1 < ${WORKDIR}/Fix-ccsp-eth-agent-build-error.patch
        touch filogic_patch_applied
    fi
}
addtask filogic_patches after do_unpack before do_configure

CFLAGS:aarch64:append = " -Werror=format-truncation=1 "
CFLAGS:aarch64:append = " -Wno-format-truncation -Wno-implicit-function-declaration -Wno-error "

EXTRA_OECONF:append_dunfell  = " --with-ccsp-arch=arm"

LDFLAGS:append =" \
    -lsyscfg \
    -lbreakpadwrapper \
"
LDFLAGS:append_dunfell = " -lpthread -lsafec-3.5.1"