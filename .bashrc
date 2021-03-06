#!/usr/bin/env bash
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

_git_branch_name() {
  if [ -d '.git' ]
  then
    echo "($(git branch | grep '\*' | cut -d ' ' -f 2)) "
  fi
}

# user@host:~$
# root@host:~#
export PS1='\u@\h:\w\$ $(_git_branch_name)'

wifion() {
  interface=$(iw dev | grep Interface | cut -d ' ' -f 2 | cut -d ' ' -f 2)
  configuration_file="/etc/wpa_supplicant/${1}.conf"
  if [ ! -f "$configuration_file" ]
  then
    echo "No Wi-Fi configuration file for \"$1\". Try running the following command:"
    echo "wpa_passphrase \"YOURESSID\" \"YOURPASSWORD\" | sudo tee $configuration_file"
    echo "See https://github.com/aminnairi/dotfiles/ for more informations"
  else
    sudo wpa_supplicant -B -i "$interface" -c /etc/wpa_supplicant/"$1".conf && sudo dhcpcd "$interface"
  fi
  if [ -n "$2" ] && [ -n "$3" ]
  then
    sudo openvpn --auth-nocache --config /etc/openvpn/client/"$2".ovpn --auth-user-pass /etc/openvpn/client/"$3".txt
  fi
}

wifioff() {
  sudo killall dhcpcd wpa_supplicant
}

# pacman -S docker
# usermod -aG docker $USER
