#!/bin/zsh

alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias vim="nvim"
alias pt="poetry run pytest -vv; poetry run pre-commit run -a; git status"
alias ptpre="poetry run pre-commit run -a; git status"
alias ruff_check_global="ruff check --config $HOME/.config/ruff/ruff.toml"
alias battery_status="upower -i `upower -e | grep 'BAT'`"
alias battery_percentage="battery_status | grep 'percentage'"
alias snx_up="zsh $HOME/.config/scripts/bakdata/snx_up.sh"
alias drc="ruff check --config $HOME/.config/ruff/ruff.toml"
alias poetry_reinstall="poetry lock --no-update && poetry install --sync"
alias help=run-help
alias td="ztodo"
alias tda="ztodo add"
alias tdd="ztodo del"
alias tdc="ztodo clear"
alias tdl="ztodo list"

# Changing "ls" to "eza"
alias ls='eza -al --color=always --group-directories-first' # my preferred listing
alias la='eza -a --color=always --group-directories-first'  # all files and dirs
alias ll='eza -l --color=always --group-directories-first'  # long format
alias lt='eza -aT --color=always --group-directories-first' # tree listing

# Bluetooth
alias bt='bluetoothctl'
alias btc='bluetoothctl connect'
alias btd='bluetoothctl disconnect'


