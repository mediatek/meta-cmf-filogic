DEFAULTTUNE = "cortexa7-soft"

AVAILTUNES += "cortexa7-soft"

require conf/machine/include/tune-cortexa7.inc

TUNEVALID[fpu-soft] = "Use software FPU."
TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'fpu-soft', ' -msoft-float', '', d)}"
TARGET_FPU = "${@bb.utils.contains('TUNE_FEATURES', 'fpu-soft', 'soft', '', d)}"

# Basic tune definitions
ARMPKGARCH:tune-cortexa7-soft = "cortexa7"
TUNE_FEATURES:tune-cortexa7-soft = "${TUNE_FEATURES:tune-cortexa7} fpu-soft"
PACKAGE_EXTRA_ARCHS:tune-cortexa7-soft  = "${PACKAGE_EXTRA_ARCHS:tune-armv7ve} cortexa7-vfp fpu-soft"
