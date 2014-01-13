#!/bin/sh
#
# Make a symbolic link of dotfiles
#
# @rev    0.1.0
# @update 2014-1-13
# @author Saneyuki Tadokoro

#
# Configuration
#
dirname=$(dirname ${0})
dotconfig=$dirname/config/dotconfig.sh

#
# update_repo_dir function which pushes commits 
#
function mk_sym_link() {
  echo -n "Would you like to make symbolic link? [y/n] (default y): "
  read ans

  while [ "${ans}" = "y" -o "${ans}" = "n" ]
  do
    echo -n "Type 'y' for yes or 'n' for no. (default y): "
    read ans
  done

  if [ "${ans}" = "n" ]; then
    echo "Aborted."
    return 0
  fi

  if [ ! -e $dotconfig ]; then
    echo "No configuration file found."
    return 0
  fi
}

#
# Get arguments of command line
#
while getopts ulU:L:h arg
do
  case $arg in
    'l') mk_sym_link ;;
    'h')
      cat << _EOL_
- mk_link.sh version 0.1.0
- Saneyuki Tadokoro @ gfunction Computer Science Laboratory

usage: ./mk_link.sh [options]

Options:
  -l : Make a symbolic link of dotfiles
  -h : Show help
_EOL_
      ;;
  esac
done
