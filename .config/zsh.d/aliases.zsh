#!/bin/zsh

alias vim="nvim"
alias help=run-help

# Changing "ls" to "eza"
# alias ls='eza -al --color=always --group-directories-first' # my preferred listing
# alias la='eza -a --color=always --group-directories-first'  # all files and dirs
# alias ll='eza -l --color=always --group-directories-first'  # long format
# alias lt='eza -aT --color=always --group-directories-first' # tree listing

# Bluetooth
alias dxm='blueutil --disconnect ac-80-0a-5a-f4-b9'
alias cxm='blueutil --disconnect ac-80-0a-5a-f4-b9; blueutil --connect ac-80-0a-5a-f4-b9'
alias saxm='SwitchAudioSource -s "WH-1000XM5"'

# git
alias config="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"
alias lazyconf="lazygit --git-dir=$HOME/.cfg/ --work-tree=$HOME"

source $HOME/.config/zsh.d/crystalloids-aliases.zsh
