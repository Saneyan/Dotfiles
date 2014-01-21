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
export ZDOTDIR_EXT=$ZDOTDIR/ext

# Configuration file's directories
export GFUNCTION_CONF_DIR=(
  #########################################
  # <Type> <Path> <As staff(0) or root(1)>
  "z        '${HOME}/.dom/zsh.d/.zshrc' 0"
  "z.env    '${HOME}/.dom/zsh.d/.zshenv' 0"
  "z.als    '${HOME}/.dom/zsh.d/.zaliases' 0"
  "z.func   '${HOME}/.dom/zsh.d/.zfunctions' 0"
  "v        '${HOME}/.dom/vimrc' 0"
  "e        '${HOME}/.dom/emacs.d/init.el' 0"
  "t        '${HOME}/.dom/tmux.conf' 0"
  "s        '/etc/ssh/sshd_conf' 1"
  "s.conf   '${HOME}/.dom/ssh/config' 0"
  "x        '/etc/X11/xorg.conf' 1"
  "x.init   '${HOME}/.dom/xinitrc' 0"
  "x.def    '${HOME}/.dom/Xdefaults' 0"
  "x.res    '${HOME}/.dom/Xresources' 0"
  "xm       '${HOME}/.dom/xmonad/xmonad.hs' 0"
  "xm.bar   '${HOME}/.dom/xmonad/xmobarrc.hs' 0"
  "xm.conf  '${HOME}/.dom/xmonad/Configs/Private.hs' 0"
)


#
# Each environments
#

# For Arch Linux
if [[ ${GFUNCTION_DIST} =~ ARCH$ ]]; then
  export GFUNCTION_CONF_DIR_EXT=(
    #########################################
    # <Type> <Path> <As staff(0) or root(1)>
    "p.conf '/etc/pacman.conf' 1"
  )

# For Gentoo Linux
elif [[ ${GFUNCTION_DIST} =~ gentoo ]]; then
  export GFUNCTION_CONF_DIR_EXT=(
    #########################################
    # <Type> <Path> <As staff(0) or root(1)>
    "p.use '/etc/portage/package.use' 1"
    "p.kwd '/etc/portage/package.accept_keywords' 1"
    "p.lic '/etc/portage/package.license' 1"
    "p.conf '/etc/portage/make.conf' 1"
  )
fi
