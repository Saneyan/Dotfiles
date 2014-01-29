#!/usr/bin/env zsh
#
# .zshenv
#
# @rev    G-0.1.0
# @update 2013-12-27
# @author Saneyuki Tadokoro <saneyan@mail.gfunction.com>

#
# Common environments
#

# Get distribution name
export GFUNCTION_DIST=`uname -r`

# ZSH directory
export ZDOTDIR=$HOME/.zsh.d

# Configuration file's directories
#########################################
# <Type> <Path> <As staff(0) or root(1)>
GFUNCTION_CONF_DIR=(\
  "z        '${HOME}/.zsh.d/.zshrc' 0"\
  "z.env    '${HOME}/.zsh.d/.zshenv' 0"\
  "z.als    '${HOME}/.zsh.d/.zaliases' 0"\
  "z.func   '${HOME}/.zsh.d/.zfunctions' 0"\
  "v        '${HOME}/.vimrc' 0"\
  "e        '${HOME}/.emacs.d/init.el' 0"\
  "t        '${HOME}/.tmux.conf' 0"\
  "s        '/etc/ssh/sshd_conf' 1"\
  "s.conf   '${HOME}/.ssh/config' 0"\
  "x        '/etc/X11/xorg.conf' 1"\
  "x.init   '${HOME}/.xinitrc' 0"\
  "x.exec   '${HOME}/.xorg.d/Xexec' 0"\
  "x.def    '${HOME}/.xorg.d/Xdefaults' 0"\
  "x.res    '${HOME}/.xorg.d/Xresources' 0"\
  "xm       '${HOME}/.xmonad/xmonad.hs' 0"\
  "xm.bar   '${HOME}/.xmonad/xmobarrc.hs' 0"\
  "xm.conf  '${HOME}/.xmonad/Configs/Private.hs' 0")


#
# Each environments
#

# For Arch Linux
if [[ ${GFUNCTION_DIST} =~ ARCH$ ]]; then
  GFUNCTION_CONF_DIR_EXT=(\
    "p.conf '/etc/pacman.conf' 1")

# For Gentoo Linux
elif [[ ${GFUNCTION_DIST} =~ gentoo ]]; then
  GFUNCTION_CONF_DIR_EXT=(\
    "p.use '/etc/portage/package.use' 1"\
    "p.kwd '/etc/portage/package.accept_keywords' 1"\
    "p.lic '/etc/portage/package.license' 1"\
    "p.conf '/etc/portage/make.conf' 1")
fi
