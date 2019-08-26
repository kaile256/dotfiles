#!/bin/sh

#### Original: /etc/X11/xinit/xinitrc
#### .Xdefault is duprecated.
#### TODO: .xprofile is for GDM/LightDM/SDDM.
####  Ref: bash/env.sh
####  Ref: i3/config
####  Ref: X11/.Xresources
####  Ref: X11/.Xmodmap

UserResources=$HOME/.config/X11/.Xresources
UserModmap=$HOME/.config/X11/.Xmodmap
SystemSources=/etc/X11/xinit/.Xresources
SystemModmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $SystemSources ]; then

    xrdb -merge $SystemSources

fi

if [ -f $SystemModmap ]; then
    xmodmap $SystemModmap
fi

if [ -f "$UserResources" ]; then 

    xrdb -merge "$UserResources"

fi

if [ -f "$UserModmap" ]; then
    xmodmap "$UserModmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi
