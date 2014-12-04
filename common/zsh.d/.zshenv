#!/usr/bin/env zsh
#
# .zshenv
#
# @rev    G-0.1.1
# @update 2014-08-19
# @author TADOKORO Saneyuki <saneyan@mail.gfunction.com>

#
# Common environments
#
# ZSH directory
export ZDOTDIR="$HOME/.zsh.d"

[ "$DMGR_ZPROFILE_SIGNATURE" != "__dzps__" ] && source $ZDOTDIR/.zprofile

#
# dmgr command
#
if [ ! -e $HOME/bin/dmgr ]; then
  echo "Before using this environment, you must install ** dmgr **."
  dmgr() {}
fi
