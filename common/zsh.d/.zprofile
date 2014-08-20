#!/usr/bin/env zsh
#
# .zprofile
#
# @rev    G-0.1.1
# @update 2014-08-19
# @author TADOKORO Saneyuki <saneyan@mail.gfunction.com>

# Default editor
export EDITOR="vim"

# Character encoding
export LANG=en_US.UTF-8

#
# Path
#
typeset -Ug path

path=(
  ~/bin(N-/)
  ~/.local/bin(N-/)
  ~/wuala(N-/)
  $path)
