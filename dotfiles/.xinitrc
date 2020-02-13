exec xrdb ~/.Xresources &
xset r rate 150 60 &
exec compton &
eval $(ssh-agent) &
exec feh --bg-scale ~/photos/wallpapers/phiphi.jpg &
exec dwm
