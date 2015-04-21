[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

feh --bg-max --randomize /mnt/data/Wallpapers/* &
compton &
sxhkd &
exec bspwm
