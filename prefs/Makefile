TARGET := iphone:clang:latest:15.0
ARCHS = arm64 arm64e

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = ColdWhitePrefs
ColdWhitePrefs_FILES = CWRootListController.m
ColdWhitePrefs_FRAMEWORKS = UIKit Foundation
ColdWhitePrefs_CFLAGS = -fobjc-arc
ColdWhitePrefs_LDFLAGS = -undefined dynamic_lookup
ColdWhitePrefs_INSTALL_PATH = /Library/PreferenceBundles
ColdWhitePrefs_RESOURCE_FILES = Root.plist Info.plist

include $(THEOS_MAKE_PATH)/bundle.mk
