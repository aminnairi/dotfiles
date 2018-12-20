# dotfiles
Dotfiles for users running Archlinux with I3 window manager

## Requirement
- [Git](https://git-scm.com/)

## Installation

### Configuration Files

```console
user@host:~$ cd
user@host:~$ git clone https://github.com/aminnairi/dotfiles.git
user@host:~$ cd dotfiles
user@host:~$ mv * ~/
user@host:~$ cd
user@host:~$ rm -rf dotfiles
```

### i3 Window Manager

```console
user@host:~# pacman -S i3 i3status i3lock dmenu
```

### VIM

```console
user@host:~# pacman -S vim
```

### Docker

```console
user@host:~# pacman -S docker
user@host:~# usermod -aG docker $USER
user@host:~# systemctl enable docker
```

*Note: you may have to reboot after issueing these commands.*

### Noto Emoji Fonts

```console
user@host:~# pacman -S noto-fonts-emoji
user@host:~$ fc-cache -f -v
```

### Fira Font

```console
user@host:~# pacman -S ttf-fira-code
```

## Update

```console
user@host:~$ cd
user@host:~$ git pull
```
