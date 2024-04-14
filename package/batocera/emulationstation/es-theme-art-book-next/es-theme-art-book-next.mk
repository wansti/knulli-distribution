################################################################################
#
# EmulationStation theme "Art Book Next"
#
################################################################################
# Version.: Commits on Mar 23, 2024
ES_THEME_ART_BOOK_NEXT_VERSION = 1820d14578dfc58a93919be2d026b438e29969b6
ES_THEME_ART_BOOK_NEXT_SITE = $(call github,anthonycaccese,art-book-next-es,$(ES_THEME_ART_BOOK_NEXT_VERSION))

define ES_THEME_ART_BOOK_NEXT_INSTALL_TARGET_CMDS
    mkdir -p $(TARGET_DIR)/usr/share/emulationstation/themes/es-theme-art-book-next
    cp -r $(@D)/* $(TARGET_DIR)/usr/share/emulationstation/themes/es-theme-art-book-next
endef

$(eval $(generic-package))
