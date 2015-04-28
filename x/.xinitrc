[[ -f ~/.Xresources ]] && xrdb -I$HOME -merge ~/.Xresources

mopidy &
feh --bg-max --randomize /mnt/data/Wallpapers/* &
compton &
sxhkd &
exec bspwm
