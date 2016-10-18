[[ -f ~/.Xresources ]] && xrdb -I$HOME -merge ~/.Xresources

xrandr --output DP-0.1.8 --left-of DP-0.8

compton &
sxhkd &
exec bspwm
