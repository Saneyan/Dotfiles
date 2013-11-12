#!/bin/sh

# Configuration
branch=""
files=(
  ".zsh.d"
  ".xmonad/xmonad.hs"
  ".xmonad/xmobarrc.hs"
  ".xmonad/Configs/Private.hs"
  ".emacs.d/init.el"
  ".vimrc"
  ".tmux.conf"
  ".Xdefaults"
  ".Xresources"
  ".xinitrc"
)

dirname=`dirname ${0}`

function update_home_dir() {
  echo -n "Would you like to pull remote repo? [y/n] (default y): "
  read ans

  if [ ! "$ans" = "n" ]; then
    print_work_dir=`pwd`
    cd $dirname

    git pull $branch

    cd $print_work_dir
  else
    echo "Did not pull remote repo."
  fi

  # Backup old files and copy new files
  if [ ! -e $dirname/backup ]; then
    mkdir $dirname/backup
  fi

  echo -e "\n * Backing up and copying..."

  for f in ${files[@]}
  do
    not_found=0
    f_dirname=`dirname ${dirname}/${f}`
    echo -ne "$f:\t"

    # Backup old files
    if [ -e $HOME/$f ]; then
      cp -r $HOME/$f $dirname/backup >/dev/null
    else
      echo -ne "\n -> [!] old file is not found\n"
      not_found=1
    fi

    # Copy new files to home dicectory
    if [ -e $dirname/$f ]; then
      if [ ! -e $f_dirname ]; then
        mkdir -p $f_dirname
      fi
      rsync -ra $dirname/$f `dirname ${HOME}/${f}` >/dev/null
    else
      echo -ne "\n -> [!] new file is not found\n"
      not_found=1
    fi

    if [ $not_found -eq 0 ]; then
      echo "Done"
    fi
  done

  echo -e "\n[i] backup directory is `find \`pwd\` -name backup`"

  # Link .zshenv if there is not this file
  echo -ne "\n * Linking .zshenv..."

  if [ ! -e $HOME/.zshenv ]; then
    ln -s $HOME/.zsh.d/.zshenv $HOME
    echo "Done"
  else
    echo -e "\n -> [i] .zshenv has already existed"
  fi
}

function update_repo_dir() {
  echo -e "\n * Updating local repo..."

  for f in ${files[@]}
  do
    not_found=0
    f_dirname=`dirname ${dirname}/${f}`
    echo -ne "$f:\t"

    if [ -e $HOME/$f ]; then
      if [ ! -e $f_dirname ]; then
        mkdir -p $f_dirname
      fi
      rsync -ra $HOME/$f $f_dirname >/dev/null
    else
      echo -ne "\n -> [!] target is not found\n"
      not_found=1
    fi

    if [ $not_found -eq 0 ]; then
      echo "Done"
    fi
  done

  echo -e "\n * Updating remote repo..."

  print_work_dir=`pwd`
  cd $dirname

  git add .
  git status

  echo -n "Please type your commit message: "
  read ans
  git commit -m $ans

  echo -n "Would you like to update remote repo? [y/n] (default y): "
  read ans
  if [ ! "$ans" = "n" ]; then
    git push $branch
  else
    echo "Remote repo was not updated."
  fi

  cd $print_work_dir
}

while getopts ulU:L:h arg
do
  case $arg in
    'l') update_home_dir ;;
    'L') update_home_dir $OPTARG ;;
    'u') update_repo_dir ;;
    'U') update_repo_dir $OPTARG ;;
    'h')
      cat << _EOL_
_EOL_
      ;;
  esac
done
