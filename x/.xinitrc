[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

sh ~/.fehbg &

sxhkd &
exec bspwm
