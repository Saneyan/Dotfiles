#!/bin/sh

#
# Check system
#
for cmd in git zsh; do
  if ! which $cmd &>/dev/null; then
    echo "Before seting up dmgr, you must install ${cmd}."
    exit 1
  fi
done

#
# Common setup
#
export DMGR_SETUP_DIRNAME=$(cd $(dirname $0) && pwd)
confdir=$HOME/.dmgr/conf

ln -sv $DMGR_SETUP_DIRNAME/bin $HOME/bin
ln -sv $DMGR_SETUP_DIRNAME/core $HOME/.dmgr
export PATH=$PATH:$HOME/bin

echo "DMGR_REPODIR=${DMGR_SETUP_DIRNAME}" > $confdir/paths/_repo
touch $confdir/{plugin,inuse}.list
echo "Created $(echo ${confdir}/{plugin,inuse}.list)"

dmgr enable system

unset confdir DMGR_SETUP_DIRNAME
