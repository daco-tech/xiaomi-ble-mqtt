#!/bin/bash
/etc/init.d/dbus start
/usr/libexec/bluetooth/bluetoothd --debug &

cron && tail -f /var/log/cron.log