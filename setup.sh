#!/bin/sh

#
# Common setup
#
dirname=$(cd $(dirname $0) && pwd)

ln -sv $dirname/bin $HOME/bin
ln -sv $dirname/core $HOME/.dmgr
export PATH=$PATH:$HOME/bin

echo "DMGR_REPODIR=${dirname}" > $HOME/.dmgr/conf/paths/_repo
touch $HOME/.dmgr/conf/inuse.list

dmgr enable system
