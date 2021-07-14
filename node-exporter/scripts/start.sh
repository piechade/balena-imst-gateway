#!/bin/bash
echo "Checking if folder /sys and /proc existing"
until [ -d "/sys" ] && [ -d "/proc" ]
do
      echo "Folder not found"
      sleep 5
done

FILE=/usr/src/app/node-exporter
if test -f "$FILE"; then
    echo "Starting prometheus-node-exporter"
   ./node-exporter --path.rootfs="/" --path.sysfs="/sys" --path.procfs="/proc" --collector.wifi
else
    echo "prometheus-node-exporter executable not found"
fi
