# Dotfiles

**dmgr-based extensible dotfiles.**

## Installation

### Requirements

 * ZSH
 * GNU make `>= 4.0`

### Install

 1. Clone from GitHub repository and change current directory:

  ```
  git clone https://github.com/Saneyan/dotfiles.git
  cd dotfiles
  ```

 2. Start setup:

  ```
  make
  ```

 3. Enable dotfile features depending on your environment:

  ```
  dmgr enable <feature_name>
  ```

### Clean

Execute `make clean` to clean dotfiles.

### Migrate

Execute `make migrate` to migrate dotfiles.

### Compiling XMonad config files.

Execute `make xmonad` to compile XMonad config files.

## About dmgr

dmgr (stands for Dotfile ManaGeR) makes extensible \*nix environment.
See https://github.com/gfunction/dmgr for more information.

### Optional features

This dotfiles provide 28 optional features.

 * m1
 * docker
 * wuala
 * pacman
 * yaourt
 * portage
 * desktop
 * dub
 * npm
 * xorg
 * xmonad
 * xfce4
 * powerline-base
 * powerline-vim
 * powerline-zsh
 * powerline-tmux
 * tp-x230
 * apt
 * aptitude
 * openrc
 * systemd
 * sysv
 * yum
 * system
 * urxvt
 * ls--
 * test

## More help
Type `make help` for more help.
