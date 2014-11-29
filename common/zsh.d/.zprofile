#!/usr/bin/env zsh
#
# .zprofile
#
# @rev    G-0.1.1
# @update 2014-08-19
# @author TADOKORO Saneyuki <saneyan@mail.gfunction.com>

unset SSH_ASKPASS

# Default editor
export EDITOR="vim"

# Character encoding
export LANG=en_US.UTF-8

# .zprofile signature
export DMGR_ZPROFILE_SIGNATURE="__dzps__"

# dmgr base paths
export DMGR_BASE_PATH=$HOME/.dmgr
source $DMGR_BASE_PATH/paths/_repo

#
# Path
#
typeset -Ug path

path=(
  ~/bin(N-/)
  ~/.local/bin(N-/)
  ~/wuala(N-/)
  $(ruby -e "print Gem.user_dir")/bin(N-/)
  $path)
