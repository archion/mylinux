#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
complete -cf sudo
alias ls='ls --color=auto'
alias ll='ls -l'
PS1='\[\e[1;37m\][\u@\h \W]\$\[\e[0m\] '
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
