#
# .zshrc created by Saneyuki Tadokoro
#

#
# General settings
#

# Default editor
export EDITOR=vim

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


# History file
HISTFILE=~/.zsh_history

# Saving history size
HISTSAVING=10000

# Saving history size (on memory)
HISTSIZE=10000


# Color settings
autoload -U colors; colors

PROMPT="%{${fg[cyan]}%}(%n#${fg[green]%}%~${fg[cyan]}%) %{${reset_color}%}"


# Alias
alias -g v="vim"
alias -g e="emacs -nw"
alias -g n="nano"
alias j="node"
alias p="pwd"
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
alias b="exit"
alias m="man"
alias t="tmux"
alias w="startx"
alias s="sudo"
alias -g k="kill"
alias -g k9="kill -9"
alias -g r="rm -f"
alias -g rd="rm -rf"
alias -g l="ls -l"
alias -g la="ls -lA"
alias x="xterm -fd IPAPGothic -fw IPAPGothic &"
alias f="firefox-nightly &"
alias fs="firefox-nightly -safe-mode &"
alias c="chromium &"
alias ci="chromium --incogniton &"
alias is="ibus-setup &"
alias pg="ps aux | grep"
alias -g pi="pacman -S"
alias -g pu="pacman -Syu"
alias -g pr="pacman -Rs"
alias -g L="| less"
alias -g T="| tail"
alias -g H="| head"
alias -g G="| grep"
alias ez="e ~/.zshrc"
alias exd="e ~/.Xdefaults"
alias exi="e ~/.xinitrc"
alias exm="e ~/.xmonad/xmonad.hs"
alias exmb="e ~/.xmonad/xmobarrc.hs"
