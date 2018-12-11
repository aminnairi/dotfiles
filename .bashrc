#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

# 20:34:30 /home/amin $
PS1='$(date +%T) $(pwd) \$ '
