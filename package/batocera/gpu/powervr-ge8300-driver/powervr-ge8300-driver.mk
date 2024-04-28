################################################################################
#
# PowerVR GE8300 GPU driver
#
################################################################################
# Version.: Commits on Apr 27, 2024
POWERVR_GE8300_VERSION = 3d34daa70c04ca24d3eab499f275b00b424b8b4d
POWERVR_GE8300_SITE = $(call github,knulli-cfw,ge8300_drivers,$(POWERVR_GE8300_VERSION))
POWERVR_GE8300_LICENSE = GPLv2

POWERVR_GE8300_INSTALL_STAGING = YES
POWERVR_GE8300_PROVIDES = libegl libgles

define POWERVR_GE8300_INSTALL_STAGING_CMDS
	mkdir -p $(STAGING_DIR)/usr/lib/pkgconfig

	cp -rf $(@D)/3rdparty/include/khronos/* $(STAGING_DIR)/usr/include/

	cp -rf $(@D)/fbdev/glibc/lib64/* $(STAGING_DIR)/usr/lib/

        $(INSTALL) -D -m 0644  $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/gpu/ge8300-drivers/egl.pc \
                $(STAGING_DIR)/usr/lib/pkgconfig/egl.pc
        $(INSTALL) -D -m 0644  $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/gpu/ge8300-drivers/glesv2.pc \
                $(STAGING_DIR)/usr/lib/pkgconfig/glesv2.pc

endef

define POWERVR_GE8300_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib

        cp -rf $(@D)/fbdev/glibc/lib64/* $(TARGET_DIR)/usr/lib/
endef

$(eval $(generic-package))
