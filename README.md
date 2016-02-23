# Dotfiles

**dmgr-based extensible dotfiles.**

![envimg](/envimg.png)

## Installation

### Requirements

 * ZSH

### Install

Initialize dmgr setting and enable 'system' feature in setup.sh.

```
git clone https://github.com/Saneyan/Dotfiles.git
Dotfiles/setup.sh
```

Enable dotfile features depending on your environment.

```
dmgr enable <feature_name>
```

## About dmgr

dmgr (stands for Dotfile manager) makes extensible \*nix environment.
This system provides 22 optional features, and enables or disables them depending upon the situation.
For example, to enable some optional features for desktop environment, you can build this environment easily.

dmgr also supports file registry that the user can access without knowing file path.

### Optional features

 * m1
 * docker
 * wuala
 * pacman
 * portage
 * desktop
 * dub
 * npm
 * xorg
 * xmonad
 * xfce4
 * powerline
 * tp-x230
 * apt
 * aptitude
 * openrc
 * systemd
 * sysv
 * yum
 * system
 * test

### Hooks

dmgr supports enable and disable hooks. These hook functions are called when executing enable or disable command.

### Usage

```
dmgr <command> (<feature_name>)
```

Type `dmgr help` for more help.

## Use debug mode

```
ln -s $HOME/bin/dmgr $HOME/bin/dmgr.debug
```
