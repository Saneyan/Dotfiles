#
# Author: Saneyuki Tadokoro
#

#
# General settings
#

# Default editor
export EDITOR="e"

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
alias -g v="vim"
alias -g e="emacs -nw"
alias -g n="nano"

# Interpreters
alias js="node"
alias py="python"
alias py2="python2"
alias rb="ruby"

# Git
alias g="git"
alias ga="git add"
alias gaa="git add ."
alias gr="git rm -f"
alias grd="git rm -fr"
alias grc="git rm -f --cached"
alias grdc="git rm -rf --cached"
alias gc="git commit -m"
alias gs="git status"
alias gu="git push"
alias gl="git pull"

# kill
alias -g k="kill"
alias -g k9="kill -9"

# ls
alias -g l="ls -l"
alias -g la="ls -lA"

# cp
alias -g cp="cp -fv"
alias -g cpr="cp -rfv"

# Applications
alias xt="xterm -fd IPAPGothic -fw IPAPGothic -e tmux &>/dev/null &"
alias fx="firefox-nightly &>/dev/null &"
alias fxs="firefox-nightly -safe-mode &>/dev/null &"
alias cr="chromium &>/dev/null &"
alias cri="chromium --incognito &>/dev/null &"
alias is="ibus-setup &>/dev/null &"
alias wu="~/wuala/wuala &>/dev/null &"

# Xmonad
alias xc="xmonad --recompile"

# Pacman
alias -g pi="pacman -S"
alias -g pu="pacman -Syu"
alias -g pr="pacman -Rs"

# Viewers with a pipe (upper case letter)
alias -g L="| less"
alias -g T="| tail"
alias -g H="| head"
alias -g G="| grep"

# Edit configration files quickly
alias ev="$EDITOR ~/.vimrc"
alias ee="$EDITOR ~/.emacs.d/init.el"
alias eb="$EDITOR ~/.bashrc"
alias ez="$EDITOR ~/.zshrc"
alias exi="$EDITOR ~/.xinitrc"
alias exd="$EDITOR ~/.Xdefaults"
alias et="$EDITOR ~/.tmux.conf"
alias exm="$EDITOR ~/.xmonad/xmonad.hs"
alias exmb="$EDITOR ~/.xmonad/xmobarrc.hs"


# Move to trash in order to avoid removing a file by mistake
function r() {
    if [ ! -e ~/.trash ]; then
				mkdir ~/.trash
    fi

    mv $1 ~/.trash
}

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
