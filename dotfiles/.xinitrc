#exec xrdb ~/.Xresources &
xset r rate 150 60 &
xrandr --output DP-1 --mode 3440x1440 --output eDP-1 --off &
# only required when wm does not have compositor
#exec picom &
#eval $(ssh-agent) &
feh --bg-scale ~/photos/wallpapers/current.jpg &
#gromit-mpx &
xbindkeys -p &
xfwm4
