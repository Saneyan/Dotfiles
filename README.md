# Dotfiles

**dmgr-based extensible dotfiles.**

## Installation

Requirements:

 * ZSH

Install:

Initialize dmgr setting and enable 'system' feature in setup.sh.

```
git clone https://github.com/Saneyan/Dotfiles.git
cd Dotfiles
./setup.sh
```

Enable dotfile features depending on your environment.

```
dmgr enable <feature_name>
```

## About dmgr

dmgr (stands for Dotfile manager) makes extensible \*nix environment.
For example, to enable some optional features for desktop environment, you can build this environment easily.
dmgr also supports disable control because the user may want to disable features depending upon the situation.

### Optional features

 * m1
 * arch
 * gentoo
 * desktop
 * dub
 * npm
 * xorg
 * xmonad
 * xfce4
 * powerline
 * tp-x230
 * system
 * test

### Hooks

dmgr supports enable and disable hooks. These hook functions are called when executing the command.

### Usage

```
dmgr <command> (<feature_name>)
```

Type `dmgr help` for more help.
