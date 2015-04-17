[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

sh ~/.fehbg &
compton &
sxhkd &
exec bspwm
