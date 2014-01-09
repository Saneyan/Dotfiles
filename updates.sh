#!/bin/sh
#
# * Dotfile Updater *
#
# Make a symbolic link of dotfiles
#
# @rev    0.1.0
# @update 2013-12-27
# @author Saneyuki Tadokoro

#
# Configuration
#
dirname=`dirname ${0}`
branch=""
files=(
  ".zsh.d/.zshrc"
  ".zsh.d/.zshenv"
  ".zsh.d/.zaliases"
  ".zsh.d/.zfunctions"
  ".xmonad/icons"
  ".xmonad/xmonad.hs"
  ".xmonad/xmobarrc.hs"
  ".xmonad/Configs/Private.hs"
  ".emacs.d/init.el"
  ".vimrc"
  ".tmux.conf"
  ".Xdefaults"
  ".Xresources"
  ".xinitrc"
)

#
# update_repo_dir function which pushes commits 
#
function links() {
  echo -n "Would you like to pull remote repo? [y/n] (default y): "
  read ans

  while [ "${ans}" = "y" -o "${ans}" = "n" ]
  do
    echo -n "Type 'y' for yes or 'n' for no. (default y): "
    read ans
  done
}

#
# Get arguments of command line
#
while getopts ulU:L:h arg
do
  case $arg in
    'u') update_repo_dir ;;
    'h')
      cat << _EOL_
- Dotfile Updater v 0.1.0
- Saneyuki Tadokoro @ gfunction Computer Science Laboratory

usage: ./update.sh [options]

Options:
  -u : Update dot-files in local depository
  -h : Show help
_EOL_
      ;;
  esac
done
