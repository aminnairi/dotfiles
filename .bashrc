#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

# 20:34:30 /home/amin $
PS1='$(date +%T) $(pwd) \$ '

# pacman -S docker
# usermod -aG docker $USER

node() {
  docker run --rm -itv $(pwd):/app -w /app node node $*
}

npm() {
  docker run --rm -itv $(pwd):/app -w /app node:alpine npm $*
}

yarn() {
  docker run --rm -itv $(pwd):/app -w /app node:alpine yarn $*
}
