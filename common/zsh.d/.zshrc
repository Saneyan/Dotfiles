#!/usr/bin/env zsh
#
# .zshrc
#
# @rev    G-0.2.2
# @update 2014-08-18
# @author Saneyuki Tadokoro <saneyan@mail.gfunction.com>

#
# General settings
#

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

# Type correct command
setopt correct

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

zstyle ':completion:*:default' menu select

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

PROMPT="%{${fg[cyan]}%}[%n@%m] %{${reset_color}%}"
RPROMPT="[%d]"


#
# Import other settings
#
paths=($ZDOTDIR/Zaliases)

for i in $(find $ZDOTDIR/ | grep -E "Zaliases\." 2>/dev/null | sed "s/.*Zaliases\.//g"); do
  dmgr has $i && paths=($ZDOTDIR/Zaliases.$i $paths)
done

# Powerline
if dmgr has "powerline"; then
  paths=($HOME/.dmgr/plugins/powerline/powerline/bindings/zsh/powerline.zsh $paths)
fi

for i in $paths; do [ -e $i ] && source $i; done
