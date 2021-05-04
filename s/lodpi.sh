#!/bin/bash
xfconf-query -c xsettings -p /Gdk/WindowScalingFactor -s 1
xfconf-query -c xfwm4 -p /general/theme -s Default
xfce4-panel -r
