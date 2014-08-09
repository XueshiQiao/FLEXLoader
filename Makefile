export THEOS_PACKAGE_DIR_NAME=./releases/debs
export TARGET=:clang:latest:5.1
export ARCHS=armv7 armv7s arm64
export SSH_ASKPASS = ./ssh-askpass

include theos/makefiles/common.mk

TWEAK_NAME = SSFLEXLoader
SSFLEXLoader_FILES = SSFLEXLoaderLoader.mm

include $(THEOS_MAKE_PATH)/tweak.mk
include $(THEOS_MAKE_PATH)/tool.mk

after-install::
	install.exec "killall -9 SpringBoard"
