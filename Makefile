TARGET := iphone:clang:latest:15.0
ARCHS = arm64 arm64e

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = ColdWhite
ColdWhite_FILES = Tweak.xm
ColdWhite_CFLAGS = -fobjc-arc
ColdWhite_FRAMEWORKS = Foundation
ColdWhite_INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS_MAKE_PATH)/tweak.mk

SUBPROJECTS += prefs
include $(THEOS_MAKE_PATH)/aggregate.mk
