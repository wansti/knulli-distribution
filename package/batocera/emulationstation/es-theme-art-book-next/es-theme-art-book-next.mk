################################################################################
#
# EmulationStation theme "Art Book Next"
#
################################################################################
# Version.: Commits on June 11, 2024
ES_THEME_ART_BOOK_NEXT_VERSION = f8b915a3ddb40a1f91a5248b9edbb1c51266b95f
ES_THEME_ART_BOOK_NEXT_SITE = $(call github,anthonycaccese,art-book-next-es,$(ES_THEME_ART_BOOK_NEXT_VERSION))

define ES_THEME_ART_BOOK_NEXT_INSTALL_TARGET_CMDS
    mkdir -p $(TARGET_DIR)/usr/share/emulationstation/themes/es-theme-art-book-next
    cp -r $(@D)/* $(TARGET_DIR)/usr/share/emulationstation/themes/es-theme-art-book-next
endef

$(eval $(generic-package))
