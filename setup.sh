#!/bin/sh

#
# Common setup
#
export DMGR_SETUP_DIRNAME=$(cd $(dirname $0) && pwd)
confdir=$HOME/.dmgr/conf

mkdir $HOME/bin
ln -sv $DMGR_SETUP_DIRNAME/core $HOME/.dmgr
export PATH=$PATH:$DMGR_SETUP_DIRNAME/bin

echo "DMGR_REPODIR=${DMGR_SETUP_DIRNAME}" > $confdir/paths/_repo
touch $confdir/{plugin,inuse}.list
echo "Created $(echo ${confdir}/{plugin,inuse}.list)"

dmgr enable system

unset confdir DMGR_SETUP_DIRNAME
