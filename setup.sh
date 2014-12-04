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

mkdir $HOME/bin
ln -sv $DMGR_SETUP_DIRNAME/core $HOME/.dmgr
export PATH=$PATH:$HOME/.dmgr/src

echo $DMGR_SETUP_DIRNAME > $HOME/.dmgr/paths/_repo
touch $HOME/.dmgr/conf/{plugin,inuse}.list
echo "Created $(echo ${HOME}/.dmgr/conf/{plugin,inuse}.list)"

dmgr enable system

unset DMGR_SETUP_DIRNAME
