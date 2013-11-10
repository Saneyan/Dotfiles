#
# .zshrc
#
# @rev    G-0.1.1
# @date   2013-11-10
# @Author Saneyuki Tadokoro

#
# General settings
#

# Default editor
export EDITOR="vim"

# Character encoding
export LANG=en_US.UTF-8

# Bind key
bindkey -v 

# Do not beep
setopt no_beep

# Move directory without typing "cd"
setopt auto_cd

# Stack history
setopt auto_pushd

# Correct spelling
setopt correct

# Supplement like --val=value
setopt magic_equal_subst

# Use prompt subset
setopt prompt_subst

# Notify as soon as possible when background jobs get change
setopt notify

# Process "which command" as =command
setopt equals

# Use auto complete
autoload -U compinit; compinit

# Show lists if there are some choices
setopt auto_list

# Change specific choice by typing [Tab]
setopt auto_menu

# Pack lists
setopt list_packed

# Show file types
setopt list_types

# Enable reverse menu complete
bindkey "^[[Z" reverse-menu-complete


# Enable glob function
setopt extended_glob


#
# History setting
#

# History file
HISTFILE=~/.zsh_history

# Saving history size
HISTSAVING=10000

# Saving history size (on memory)
HISTSIZE=10000


#
# Path
#
PATH=$PATH:$HOME/bin
PATH=$PATH:$HOME/.gem/ruby/2.0.0/bin
PATH=$PATH:$HOME/wuala

#
# Colors and prompt
#

# Color setting
autoload -U colors; colors

PROMPT="%{${fg[cyan]}%}(%n#${fg[green]%}%~${fg[cyan]}%) %{${reset_color}%}"


#
# Alias
#

# General commands
alias b="exit"
alias m="man"
alias t="tmux"
alias w="startx"
alias s="sudo"
alias p="pwd"
alias pg="ps aux | grep"

# Editors
alias -g e="$EDITOR"

# Interpreters
alias js="node"
alias py="python"
alias py2="python2"
alias rb="ruby"

# kill
alias -g k="kill"
alias -g k9="kill -9"

# ls
alias -g l="ls -l"
alias -g la="ls -lA"

# cp
alias -g cp="cp -fv"
alias -g cpr="cp -rfv"

# mv
alias -g mv="mv -v"

# Applications
# /usr/bin/firefox-nightly -> /opt/firefox-nightly/firefox
#alias xt="xterm -fd IPAPGothic -fw IPAPGothic -e tmux &>/dev/null &"
alias fxs="firefox-nightly -safe-mode &>/dev/null &"
alias cri="chromium --incognito &>/dev/null &"
alias is="ibus-setup &>/dev/null &"

# Xmonad
alias xc="ghc --make\
  ~/.xmonad/xmonad.hs\
  ~/.xmonad/Configs/Private.hs\
  -o ~/.xmonad/xmonad-x86_64-linux"

# System
alias sr="sudo reboot"
alias sd="sudo shutdown"

# Emerge
alias pi="sudo emerge -av"
alias pu="sudo emerge --sync && sudo emerge -avuDN world"
alias pr="sudo emerge --unmerge"

# Viewers with a pipe (upper case letter)
alias -g L="| less"
alias -g T="| tail"
alias -g H="| head"
alias -g G="| grep"

# Move to trash in order to avoid removing a file by mistake
function r() {
  if [ ! -e ~/.trash ]; then
    mkdir ~/.trash
  fi

  mv $1 ~/.trash
}

# Empty trash
function em() {
  RES=1

  echo -n "Do you want to empty trash? [y/n] (default n): "
  read ANS

  if [ -e ~/.trash -a "$ANS" = "y" ]; then
    rm -rf ~/.trash/*
    
    if [ "$?" -eq 0 ]; then
      echo "Trash has been empty :)"
      RES=0
    fi
  fi

  if [ "$RES" -eq 1 ]; then
    echo "Trash not empty :("
  fi
}

# Git
function g() {
  ###################
  # <Flag> <Command>
  configs=(
    "a add"
    "A add ."
    "c commit -m"
    "s status"
    "u push"
    "U push"
    "l pull"
    "L pull"
    "r rm -rf"
    "R rm -rf --cached"
    "o checkout"
    "b branch"
    "e rebase"
  )

  desc="Flag\tCommand"

  while getopts a:Ac:suU:lL:r:R:o:b:eh arg
  do
    for item in $configs
    do
      config=(`echo ${item}`)
      if [ "${arg}" = "${item[1]}" ]; then
        eval "git ${item:2} ${OPTARG}"
      elif [ "${arg}" = "h" ]; then
        view_configs $desc $configs
        break
      fi
    done
  done
}

# Edit configuration files
function ec() {
  #########################################
  # <Type> <Path> <As staff(0) or root(1)>
  configs=(
    "z '${HOME}/.zshrc' 0"
    "v '${HOME}/.vimrc' 0"
    "e '${HOME}/.emacs.d/init.el' 0"
    "t '${HOME}/.tmux.conf' 0"
    "s '/etc/ssh/sshd_conf' 1"
    "s.conf '${HOME}/.ssh/config' 0"
    "x '/etc/X11/xorg.conf' 1"
    "x.init '${HOME}/.xinitrc' 0"
    "x.def '${HOME}/.Xdefaults' 0"
    "x.res '${HOME}/.Xresources' 0"
    "xm '${HOME}/.xmonad/xmonad.hs' 0"
    "xm.bar '${HOME}/.xmonad/xmobar.hs' 0"
    "xm.conf '${HOME}/.xmonad/Configs/Private.hs' 0"
    "p.use '/etc/portage/package.use' 1"
    "p.kwd '/etc/portage/package.accept_keywords' 1"
    "p.lic '/etc/portage/package.license' 1"
    "p.make '/etc/portage/make.conf' 1"
  )

  desc="Type\tPath\tAs staff (0) or root (1)"

  while getopts hf: arg
  do
    case $arg in
      'f')
        for item in $configs
        do
          config=(`echo ${item}`)
          if [ "${config[1]}" = "${OPTARG}" ]; then
            CONF=$config[2]; SUDO=$config[3]
            break
          fi
        done
        ;;
      'h')
        view_configs $desc $configs
        break
        ;;
      '*')
        echo -e "Invalid argument '${arg}'\n"
        view_configs $desc $configs
        break
        ;;
    esac

    if [ ! -z "${CONF+E}" ]; then
      if [ $SUDO -eq 1 ]; then
        eval "sudo ${EDITOR} ${CONF}"
      else
        eval "${EDITOR} ${CONF}"
      fi
    else
      echo -e "Invalid argument value '${OPTARG}'\n"
      view_configs $desc $configs
    fi
  done
}

# 1st arg must be Description, after 2nd args must be Configurations
function view_configs() {
  echo -e $1

  for item in ${@:2}
  do
    config=(`echo ${item}`)
    echo -e "${config[1]}\t${config[2]}\t${config[3]}"
  done
}
