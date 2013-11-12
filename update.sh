#!/bin/sh

if [ ! -e ./backup ]; then
  mkdir ./backup
fi

# Backup old files
cp -r $HOME/.{zsh.d,xmonad,vim,emacs.d,vimrc,tmux.conf,Xdefaults,Xresources,xinitrc} ./backup
rsync -av ./.{zsh.d,xmonad,vim,emacs.d,vimrc,tmux.conf,Xdefaults,Xresources,xinitrc} $HOME
