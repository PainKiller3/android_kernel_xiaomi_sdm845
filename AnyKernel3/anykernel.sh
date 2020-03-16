# AnyKernel3 Ramdisk Mod Script
# osm0sis @ xda-developers

## AnyKernel setup
# begin properties
properties() { '
kernel.string=SilverCore Kernel by blitzfire3 & saikiran001
do.devicecheck=1
do.modules=0
do.cleanup=1
do.cleanuponabort=0
device.name1=beryllium
device.name2=PocoF1
device.name3=PocophoneF1
device.name4=dipper
device.name5=MI 8
supported.versions=10,10.0
'; } # end properties

# shell variables
block=/dev/block/bootdevice/by-name/boot;
is_slot_device=auto;
ramdisk_compression=auto;

## AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. tools/ak3-core.sh;

# Set Android version for kernel
ver="$(file_getprop /system/build.prop ro.build.version.release)"
if [ ! -z "$ver" ]; then
  patch_cmdline "androidboot.version" "androidboot.version=$ver"
else
  patch_cmdline "androidboot.version" ""
fi

## IMPORTANT NOTES
ui_print " "
ui_print "!!! TWEAKING SOME PERFORMANCE !!!"
ui_print "INSTALLING SOME SILVERCORE GOODIES"

## AnyKernel install
dump_boot;

# migrate from /overlay to /overlay.d to enable SAR Magisk
if [ -d $ramdisk/overlay ]; then
  rm -rf $ramdisk/overlay;
fi;

write_boot;
## end install

