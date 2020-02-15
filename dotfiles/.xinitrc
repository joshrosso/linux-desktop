exec xrdb ~/.Xresources &
xset r rate 150 60 &
exec picom &
eval $(ssh-agent) &
feh --bg-scale ~/photos/wallpapers/current.jpg &
exec dwm
