export XMODIFIERS="@im=ibus"
export GTK_IM_MODULE="ibus"
export QT_IM_MODULE="xim"

# Start ibus daemon which supports xterm
ibus-daemon --daemonize --xim

# Normal cursor
xsetroot -cursor_name left_ptr

# Set background
feh --bg-scale ~/Pictures/xmonad.png

# Apply X settings
xrdb -load ~/.Xdefaults
xcompmgr -c &
xautolock -time 10 -locker slimlock &
unclutter -idle 1s &

if [[ ${GFUNCTION_DIST} =~ gentoo ]]; then
  xrandr --output DVI-I-2 --mode 1920x1080
  xrandr --output DVI-I-3 --mode 2560x1440 --rotate left --left-of DVI-I-2
fi

exec xmonad
