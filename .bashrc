#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

user() {
  if [ "$(id -u)" -eq 0 ]
  then
    echo '#'
  else
    echo '>'
  fi
}

# /home/amin >
export PS1='$(pwd) $(user) '

wifion() {
  interface=$(iw dev | grep Interface | cut -d ' ' -f 2 | cut -d ' ' -f 2)
  sudo wpa_supplicant -B -i $interface -c /etc/wpa_supplicant/$1.conf && sudo dhcpcd $interface
}

wifioff() {
  sudo killall dhcpcd wpa_supplicant
}

# pacman -S docker
# usermod -aG docker $USER

node() {
  docker run --rm -itv $(pwd):/app -w /app node:alpine node $*
}

npm() {
  docker run --rm -itv $(pwd):/app -w /app node:alpine npm $*
}

yarn() {
  docker run --rm -itv $(pwd):/app -w /app node:alpine yarn $*
}
