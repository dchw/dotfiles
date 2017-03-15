#!/bin/sh

xrdb ~/.Xresources
xrdb -merge ~/.terminalcolors 

for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
 [ -x "$f" ] && . "$f"
done
unset f

exec xrandr --output DP-0.8 --right-of DP-0.1.8 &
exec feh --no-xinerama --bg-center ~/wallpaper.jpg &
exec sxhkd &
exec bspwm
