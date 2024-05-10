################################################################################
#
# PowerVR GE8300_DRIVER GPU driver
#
################################################################################
# Version.: Commits on Apr 27, 2024
POWERVR_GE8300_DRIVER_VERSION = 3d34daa70c04ca24d3eab499f275b00b424b8b4d
POWERVR_GE8300_DRIVER_SITE = https://github.com/knulli-cfw/ge8300-drivers.git
POWERVR_GE8300_DRIVER_SITE_METHOD = git

POWERVR_GE8300_DRIVER_LICENSE = Propietary

POWERVR_GE8300_DRIVER_INSTALL_STAGING = YES
POWERVR_GE8300_DRIVER_PROVIDES = libegl libgles

define POWERVR_GE8300_DRIVER_INSTALL_STAGING_CMDS
        mkdir -p $(STAGING_DIR)/usr/lib/pkgconfig

        cp -rf $(@D)/3rdparty/include/khronos/* $(STAGING_DIR)/usr/include/

        cp -rf $(@D)/fbdev/glibc/lib64/* $(STAGING_DIR)/usr/lib/

        $(INSTALL) -D -m 0644  $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/gpu/powervr-ge8300-driver/egl.pc \
                $(STAGING_DIR)/usr/lib/pkgconfig/egl.pc
        $(INSTALL) -D -m 0644  $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/gpu/powervr-ge8300-driver/glesv2.pc \
                $(STAGING_DIR)/usr/lib/pkgconfig/glesv2.pc

endef

define POWERVR_GE8300_DRIVER_INSTALL_TARGET_CMDS
        mkdir -p $(TARGET_DIR)/usr/lib

        cp -rf $(@D)/fbdev/glibc/lib64/* $(TARGET_DIR)/usr/lib/
endef

$(eval $(generic-package))

