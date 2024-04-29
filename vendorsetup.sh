FDEVICE="selene"
#set -o xtrace

fox_get_target_device() {
  local chkdev=$(echo "$BASH_SOURCE" | grep -w $FDEVICE)
  if [ -n "$chkdev" ]; then
    FOX_BUILD_DEVICE="$FDEVICE"
  else
    chkdev=$(set | grep BASH_ARGV | grep -w $FDEVICE)
    [ -n "$chkdev" ] && FOX_BUILD_DEVICE="$FDEVICE"
  fi
}

if [ -z "$1" ] && [ -z "$FOX_BUILD_DEVICE" ]; then
  fox_get_target_device
fi

# Dirty Fix: Only declare orangefox vars when needed
if [ -f "$(gettop)/bootable/recovery/orangefox.cpp" ]; then
  echo -e "\x1b[96m[INFO]: Setting up OrangeFox build vars for selene...\x1b[m"
  if [ "$1" = "$FDEVICE" ] || [  "$FOX_BUILD_DEVICE" = "$FDEVICE" ]; then
    # Version / Maintainer infos
    export OF_MAINTAINER="Hasan6034"
    export FOX_VERSION=R11.1
    export FOX_VANILLA_BUILD=1
    export FOX_BUILD_TYPE="Unofficial"

    # Device info
    export FOX_AB_DEVICE=1
    export FOX_VIRTUAL_AB_DEVICE=1
    export TARGET_DEVICE_ALT="selenes, eos"

    # OTA / DM-Verity / Encryption
    export OF_DISABLE_MIUI_OTA_BY_DEFAULT=1
    export OF_FIX_OTA_UPDATE_MANUAL_FLASH_ERROR=1

    export OF_DONT_PATCH_ON_FRESH_INSTALLATION=1
    export OF_DONT_PATCH_ENCRYPTED_DEVICE=1
    export OF_KEEP_DM_VERITY_FORCED_ENCRYPTION=1
    export OF_SKIP_DECRYPTED_ADOPTED_STORAGE=1
    export OF_FORCE_USE_RECOVERY_FSTAB=1

    # Display / Leds
    export OF_SCREEN_H="2400"
    export OF_STATUS_H="100"
    export OF_STATUS_INDENT_LEFT=64
    export OF_STATUS_INDENT_RIGHT=64
    export OF_HIDE_NOTCH=1
    export OF_CLOCK_POS=1 # left and right clock positions available
    export OF_USE_GREEN_LED=0
    export OF_FL_PATH1="/system/flashlight"

    # Other OrangeFox configs
    export OF_ENABLE_LPTOOLS=1
    export OF_ALLOW_DISABLE_NAVBAR=0
    export OF_QUICK_BACKUP_LIST="/boot;/data;"
    export FOX_BUGGED_AOSP_ARB_WORKAROUND="1616300800"; # Sun 21 Mar 04:26:40 GMT 2021
    export FOX_REPLACE_BOOTIMAGE_DATE=1
    export FOX_DELETE_AROMAFM=1
    export FOX_USE_NANO_EDITOR=1

    export FOX_DELETE_INITD_ADDON=1
    export FOX_DELETE_MAGISK_ADDON=1
    export OF_NO_ADDITIONAL_MIUI_PROPS_CHECK=1
    export OF_NO_SPLASH_CHANGE=1
  fi
fi