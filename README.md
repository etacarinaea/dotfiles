# dotfiles

Linux config files and scripts

The main branch is `desktop`

I'm using a slightly modified version of the method described by *StreakyCobra*
and others in
[this Hacker News thread](https://news.ycombinator.com/item?id=11070797).

## Installation

```
curl -sL https://raw.githubusercontent.com/etacarinaea/dotfiles/desktop/dotfiles-install.sh | bash
```

..or if you want to do it manually you can also enter the following commands in
a shell:

```
git clone --mirror git@github.com:etacarinaea/dotfiles.git $HOME/.dotfiles
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME config \
  --local status.showUntrackedFiles no
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
```

## General

### `.Xmodmap`

Rebinds caps lock to `Super_L`

### `.config/i3/rename-workspace`

Renames the current i3 workspace while preserving the numbering. Entering
nothing removes the name again leaving only the number.

Example screenshot:

![i3bar screenshot](https://raw.githubusercontent.com/etacarinaea/dotfiles/screenshots/i3bar.png)


## t440s

### `.Xmodmap`

Disables the function keys so `etc/acpi` can handle them instead.

### `etc/acpi`

Handles function keys. Keys implemented:

* mute
* volume down
* volume up
* brightness down
* brightness up

Volume is only implemented for `pulseaudio`.

All keys also send a notification using `libnotify`.

`Fn+Esc` (FnLk) and `Fn+Space` (keyboard backlight) worked out of the box for
me.

### `etc/systemd/system/wakelock.service`

systemd service for locking the screen with i3lock

It also uses ImageMagick to capture the screen and then display a blurred
version with some text overlaid as the lock screen's background.

The normal `-blur` function is pretty slow for high sigma (and `-gaussian-blur`
is even slower), so depending on the system it could take a while for `convert`
to run, which delays locking.

Scaling the image by some factor A < 1 and then scaling it back up by A's
multiplicative inverse with a Gaussian filter with some sigma, gives more or
less the same blur as applying a Gaussian blur with that sigma times the
multiplicative inverse of A without scaling, and is a lot faster.

So for example if you'd usually need a sigma of 40, and you scale the image by a
factor of 0.1, you end up only having to use a sigma of 4 to get more or
less the same visual effect.

Obviously if the scaling factor is too small you'll end up loosing too much
information and the end result will just look like a gradient or a solid colour.

