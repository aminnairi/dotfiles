# dotfiles
Dotfiles for users running Archlinux with I3 window manager

## Requirement
- [Git](https://git-scm.com/)

## Installation

### Configuration Files

```console
user@host:~$ cd
user@host:~$ git init
user@host:~$ git remote add origin https://github.com/aminnairi/dotfiles.git
user@host:~$ git pull
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

### Noto Emoji Fonts

```console
user@host:~# pacman -S noto-fonts-emoji
user@host:~$ fc-cache -f -v
```

*Note: you may have to reboot after issueing these commands.*

## Update

```console
user@host:~$ cd
user@host:~$ git pull
```
