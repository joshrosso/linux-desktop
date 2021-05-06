#!/bin/sh

## this script updates the dwm status bar with the date, time, and battery percentage
while true; do
  now=$(</sys/class/power_supply/BAT0/energy_now)
  full=$(</sys/class/power_supply/BAT0/energy_full)
  bat=$(echo "scale=2; $now / $full * 100" | bc)
  echo "scale=2; $now / $full * 100" | bc
  xsetroot -name "| ${bat}% | $(date)"
  sleep 2
done
