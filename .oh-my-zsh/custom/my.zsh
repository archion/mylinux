# 增强的历史补全
bindkey '\eOA' history-beginning-search-backward
bindkey '\eOB' history-beginning-search-forward
bindkey '^[[5~' beginning-of-history
bindkey '^[[6~' end-of-history
bindkey '^U' backward-kill-line
export EDITOR=vim
#add in /etc/profile
#export PATH=$PATH:~/bin:~/.cabal/bin
unalias gm
alias ls='ls --time-style="+%Y-%m-%d %H:%M:%S"'
alias ll='ls -lh'
alias tmux="tmux -2"
alias qmv="qmv -f do"
alias fuck='$(thefuck $(fc -ln -1))'
