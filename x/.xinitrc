[[ -f ~/.Xresources ]] && xrdb -I$HOME -merge ~/.Xresources

compton &
sxhkd &
exec bspwm
