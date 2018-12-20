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
