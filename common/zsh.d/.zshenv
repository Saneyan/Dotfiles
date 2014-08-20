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

[ ! -e $HOME/bin/dmgr ] && echo "Before using this environment, you must install dmgr to ~/bin/dmgr."
