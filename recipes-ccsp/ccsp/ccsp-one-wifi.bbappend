SRC_URI:remove += "git://github.com/rdk-gdcs/lan_web.git;protocol=https;branch=main_branch_multiap_update;name=lan_web;destsuffix=lan_web"
SRC_URI:remove = "${CMF_GIT_ROOT}/rdkb/components/opensource/ccsp/OneWifi;protocol=${CMF_GIT_PROTOCOL};branch=${CMF_GIT_BRANCH};name=OneWifi"
SRC_URI = "git://github.com/rdkcentral/OneWifi.git;protocol=https;branch=develop;name=OneWifi"

