$(guile (load "guile.scm"))

install: setup
  mkdir $HOME/bin
  _link_repo
  _link_script
  touch $HOME/.dmgr/conf/{plugin,inuse}.list
  echo "Created $(echo ${HOME}/.dmgr/conf/{plugin,inuse}.list)"
  dmgrctl enable system

clean:
  dmgrctl disable :all
  rm -fv $HOME/.dmgr/conf/{plugin,inuse}.list
  _unlink_script
  _unlink_repo

  echo -n "Do you want to delete $HOME/bin? (y/n): "
  while read opt; do
    [[ "$opt" =~ "y|n" ]] && break
    echo "Type (y or n): "
  done

  [ "${opt}" = "y" ] && rm -rfv $HOME/bin

migrate:
  dmgrctl disable :all:stash
  _unlink_script
  _unlink_repo
  _link_repo
  _link_script
  dmgrctl enable :pop

setup:
  git submodule init
  git submodule update

link:
  ln -sv $DMGR_SETUP_DIRNAME/core $HOME/.dmgr
  echo $DMGR_SETUP_DIRNAME > $HOME/.dmgr/paths/_repo
  for dst in dmgr dmgr.debug dmgrctl dmgrctl.debug; do
    ln -sv $HOME/.dmgr/src/dmgr $HOME/bin/$dst
  done

unlink:
  for dst in dmgr dmgr.debug dmgrctl dmgrctl.debug; do
    rm -fv $HOME/bin/$dst
  done
  rm -fv $HOME/.dmgr/paths/_repo $HOME/.dmgr
