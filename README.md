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

Same thing goes for the `root` user.

```console
root@host:~# cd
root@host:~# git clone https://github.com/aminnairi/dotfiles.git
root@host:~# cd dotfiles
root@host:~# mv * ~/
root@host:~# cd
root@host:~# rm -rf dotfiles
```

### i3 Window Manager

```console
root@host:~# pacman -S i3 i3status i3lock dmenu
```

### VIM

```console
root@host:~# pacman -S vim vim-nerdtree
```

### Docker

```console
root@host:~# pacman -S docker
root@host:~# usermod -aG docker $USER
root@host:~# systemctl enable docker
```

*Note: you may have to reboot after issueing these commands.*

### Icons & Emojis

```console
root@host:~# pacman -S noto-fonts-emoji otf-font-awesome
user@host:~$ fc-cache -f -v
```

### Fira Font

```console
root@host:~# pacman -S ttf-fira-code
```

### Wifi

```console
root@host:~# pacman -S iw wpa_supplicant dhcpcd sudo
root@host:~# wpa_passphrase "ESSID" "PASSWORD" > /etc/wpa_supplicant/example.conf
user@host:~$ wifion example
user@host:~$ wifioff
```

### OpenVPN

```console
root@host:~# pacman -S openvpn
root@host:~# mv ~/Downloads/config.ovpn /etc/openvpn/client
root@host:~# mv ~/Downloads/credentials.txt /etc/openvpn/client
user@host:~$ wifion example config credentials
```

### Volume

```console
root@host:~# pacman -S pulseaudio playerctl
```

### Wallpaper

```console
user@host:~$ mkdir -p ~/Pictures
user@host:~$ mv ~/Downloads/yourPicture.jpg ~/Pictures/wallpaper.jpg
```

## Update

```console
user@host:~$ cd
user@host:~$ git pull
root@host:~# cd
root@host:~# git pull
```
