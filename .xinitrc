export XMODIFIERS=@im=ibus

# Start ibus daemon which supports xterm
ibus-daemon --daemonize --xim

# Normal cursor
xsetroot -cursor_name left_ptr

# Set background
display -window root ~/Pictures/xmonad.png

exec xmonad
