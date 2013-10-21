export XMODIFIERS=@im=ibus

# Start ibus daemon which supports xterm
ibus-daemon --daemonize --xim

# Normal cursor
xsetroot -cursor_name left_ptr

# Set background
feh --bg-scale ~/Pictures/xmonad.png

# Apply X settings
xrdb -load ~/.Xdefaults
xcompmgr -c &
unclutter -idle 1s &

exec xmonad
