export XMODIFIERS=@im=ibus

ibus-daemon --daemonize --xim

display -window root ~/Pictures/xmonad.png

exec xmonad
