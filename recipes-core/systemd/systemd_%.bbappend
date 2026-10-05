FILESEXTRAPATHS:prepend := "${THISDIR}/files:"


SRC_URI += " \
    ${@bb.utils.contains('DISTRO_FEATURES','wrynose', '', 'file://0001-basic-add-PIDFS-magic-31709.patch',d)} \
    ${@bb.utils.contains('DISTRO_FEATURES','wrynose', '', 'file://0002-basic-Add-BCACHEFS-magic.patch',d)} \
           "
