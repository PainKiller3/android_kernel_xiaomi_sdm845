#!/system/bin/sh

# Thermals permissions
chmod 644 /sys/class/thermal/thermal_message/sconfig

# Scrolling Cache
setprop persist.sys.scrollingcache 1

killall -9 android.process.media
killall -9 mediaserver

echo "N" > /sys/kernel/debug/debug_enabled
echo "1" > /sys/module/subsystem_restart/parameters/disable_restart_work
echo "0 0 0 0" > /proc/sys/kernel/printk
echo "128" > /proc/sys/net/core/netdev_max_backlog
echo 1 > /sys/module/printk/parameters/console_suspend
echo 3000 > /proc/sys/vm/dirty_expire_centisecs
echo 0 > /d/tracing/tracing_on
echo 0 > /d/tracing/events/ext4/enable
echo 0 > /d/tracing/events/f2fs/enable
echo 0 > /d/tracing/events/block/enable
setprop sys.use_fifo_ui 1
setprop persist.radio.add_power_save 1
setprop debug.composition.type c2d
setprop video.accelerate.hw 1

# Touch Tweaks
setprop touch.pressure.scale 0.001
setprop persist.sys.ui.hw 1
setprop view.scroll_friction 10
setprop touch.size.calibration diameter
setprop touch.size.scale 1
setprop touch.size.bias 0
setprop touch.size.isSummed 0
setprop touch.orientation.calibration none
setprop touch.distance.calibration none
setprop touch.distance.scale 0
setprop touch.coverage.calibration box
setprop touch.gestureMode spots
setprop MultitouchSettleInterval 1ms
setprop MultitouchMinDistance 1px
setprop TapInterval 1ms
setprop TapSlop 1px

# Disable GooglePlay Wakelocks
pm disable 'com.google.android.gsf/.update.SystemUpdateService'
pm disable 'com.android.vending/com.google.android.gms.measurement.AppMeasurementReceiver'
pm disable 'com.android.vending/com.google.firebase.iid.FirebaseInstanceIdInternalReceiver'
pm disable 'com.android.vending/com.google.firebase.iid.FirebaseInstanceIdReceiver'
pm disable 'com.google.android.gms/.update.SystemUpdateActivity'
pm disable 'com.google.android.gms/.update.SystemUpdateService$ActiveReceiver'
pm disable 'com.google.android.gms/.update.SystemUpdateService$Receiver'
pm disable 'com.google.android.gms/.update.SystemUpdateService$SecretCodeReceiver'
pm disable 'com.google.android.gms/com.google.android.gms.analytics.AnalyticsReceiver'
pm disable 'com.google.android.gms/com.google.android.gms.gcm.nts.SchedulerInternalReceiver'
pm disable 'com.google.android.gms/com.google.android.gms.gcm.nts.SchedulerReceiver'
pm disable 'com.google.android.gms/com.google.android.gms.measurement.AppMeasurementInstallReferrerReceiver'
pm disable 'com.google.android.gms/com.google.android.gms.measurement.AppMeasurementReceiver'
pm disable 'com.google.android.gms/com.google.android.gms.measurement.AppMeasurementService'
pm disable 'com.google.android.gms/com.google.android.gms.measurement.PackageMeasurementReceiver'
pm disable 'com.google.android.gms/com.google.android.gms.measurement.PackageMeasurementService'
pm disable 'com.google.android.gms/com.google.android.gms.measurement.service.MeasurementBrokerService'
pm disable 'com.google.android.gms/com.google.android.location.internal.AnalyticsSamplerReceiver'
pm disable 'com.google.android.gsf/.update.SystemUpdateActivity'
pm disable 'com.google.android.gsf/.update.SystemUpdatePanoActivity'
pm disable 'com.google.android.gsf/.update.SystemUpdateService$Receiver'
pm disable 'com.google.android.gsf/.update.SystemUpdateService$SecretCodeReceiver'

for i in $(find /sys/ -name debug_mask); do
echo "0" > $i;
done
for i in $(find /sys/ -name debug_level); do
echo "0" > $i;
done
for i in $(find /sys/ -name edac_mc_log_ce); do
echo "0" > $i;
done
for i in $(find /sys/ -name edac_mc_log_ue); do
echo "0" > $i;
done
for i in $(find /sys/ -name enable_event_log); do
echo "0" > $i;
done
for i in $(find /sys/ -name log_ecn_error); do
echo "0" > $i;
done
for i in $(find /sys/ -name snapshot_crashdumper); do
echo "0" > $i;
done
if [ -e /sys/module/logger/parameters/log_mode ]; then
 echo "2" > /sys/module/logger/parameters/log_mode
fi;
for i in $(find /sys/ -name debug_level); do
 echo "0" > $i;
done
for i in $(find /sys/ -name edac_mc_log_ce); do
 echo "0" > $i;
done
for i in $(find /sys/ -name edac_mc_log_ue); do
 echo "0" > $i;
done
for i in $(find /sys/ -name enable_event_log); do
 echo "0" > $i;
done
for i in $(find /sys/ -name log_ecn_error); do
 echo "0" > $i;
done
for i in $(find /sys/ -name snapshot_crashdumper); do
 echo "0" > $i;
done

# Disable ZRAM
sleep 5
swapoff /dev/block/zram0

# Charge throttling
echo 1 > /sys/module/smb_lib/parameters/skip_thermal

# FS-Trim it!
fstrim /data;
fstrim /cache;
fstrim /system;
