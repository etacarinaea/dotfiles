#!/bin/sh
#

if [ -d /etc/X11/xinit/xinitrc.d ]; then
    for f in /etc/X11/xinit/xinitrc.d/*; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi
[[ -s ~/.Xmodmap ]] && xmodmap ~/.Xmodmap
[[ -s ~/.Xresources ]] && xrdb -merge ~/.Xresources

xset +fp ~/.fonts
xset fp rehash

xset r rate 300 30
xset m 1 1

# get _CURRENT_ wallpaper from ~/images/wallpapers independent of file ending
# if _CURRENT_ matches more than one file the first match is used
wallpath="$(find ~/images/wallpapers/ -name _CURRENT_* | head -n 1)"
feh --bg-fill $wallpath &

picom --experimental-backends -b
exec i3
