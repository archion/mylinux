# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="bira"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git command-not-found history-substring-search tmux-title)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
#
source .zprofile 2>/dev/null

# 增强的历史补全
bindkey '\eOA' history-beginning-search-backward
bindkey '\eOB' history-beginning-search-forward
bindkey '^[[5~' beginning-of-history
bindkey '^[[6~' end-of-history
bindkey '^U' backward-kill-line
#add in /etc/profile
#export PATH=$PATH:~/bin:~/.cabal/bin
unalias gm
alias ls='ls --time-style="+%Y-%m-%d %H:%M:%S"'
alias ll='ls -lh'
alias tmux="tmux -2"
alias qmv="qmv -f do"
alias fuck='$(thefuck $(fc -ln -1))'
#alias nvim="nvim '+colorscheme solarized' '+set background=dark'"
#alias nvim-wrapper="nvim-wrapper '+colorscheme solarized' '+set background=dark'"
alias vim="nvim"
alias vimdiff="vim -d"
alias termux="adb forward tcp:8022 tcp:8022 && ssh 127.0.0.1 -p 8022"

# added by travis gem
[ -f /home/archion/.travis/travis.sh ] && source /home/archion/.travis/travis.sh
