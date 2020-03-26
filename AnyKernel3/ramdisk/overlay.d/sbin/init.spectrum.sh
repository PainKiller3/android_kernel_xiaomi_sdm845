#!/system/bin/sh
# SPECTRUM KERNEL MANAGER
# Franco KERNEL MANAGER
# Profile initialization script by nathanchance

# If there is not a persist value, we need to set one

if [ ! -f /data/property/persist.spectrum.profile ]; then
    setprop persist.spectrum.profile 0
fi

if [ ! -f /data/property/persist.fku.profiles ]; then
		setprop persist.fku.profiles 3
fi
