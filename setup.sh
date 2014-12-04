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
export PATH=$PATH:$HOME/bin

mkdir $HOME/bin
ln -sv $DMGR_SETUP_DIRNAME/core $HOME/.dmgr

for dst in dmgr dmgr.debug dmgrctl dmgrctl.debug; do
  ln -sv $HOME/.dmgr/src/dmgr $HOME/bin/$dst
done

echo $DMGR_SETUP_DIRNAME > $HOME/.dmgr/paths/_repo
touch $HOME/.dmgr/conf/{plugin,inuse}.list
echo "Created $(echo ${HOME}/.dmgr/conf/{plugin,inuse}.list)"

dmgrctl enable system

unset DMGR_SETUP_DIRNAME
