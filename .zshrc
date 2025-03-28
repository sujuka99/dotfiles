setopt nomatch
unsetopt autocd beep extendedglob
bindkey -e

zstyle :compinstall filename '/home/sujuka99/.zshrc'

autoload -Uz compinit
# negation, so that at least one exits on 0
[ ! "$(find ~/.zcompdump -mtime +1)" ] || compinit
compinit -C

# Autoload
autoload -U colors && colors

# Options:
setopt NOTIFY
setopt PROMPT_SUBST # Allow manually setting $PS1
setopt APPEND_HISTORY # Append history to old
# setopt INC_APPEND_HISTORY # Add each line to history immediately
setopt SHARE_HISTORY # Combine all shells' histories, append to old after each line.
setopt EXTENDED_HISTORY # Save time and date of commands. BREAKS OTHER SHELLS.
setopt HIST_IGNORE_ALL_DUPS # Collapse repeated commands into one.
setopt NO_HIST_BEEP # No beeping when scrolling history past the ends.
setopt TRANSIENTRPROMPT # $RPS1 doesn't show in past lines.
setopt EXTENDED_GLOB # Enable sophisticated pattern matching. BREAKS some stuff like '*'.
setopt CORRECT

# this variable can be changed later to change the fraction of the line 
export PROMPT_PERCENT_OF_LINE=20

# make a function, so that it can be evaluated repeatedly
function myPromptWidth() { 
  echo $(( ${COLUMNS:-80} * PROMPT_PERCENT_OF_LINE / 100 )) 
}
width_part='$(myPromptWidth)'

PS1="%F{216}%${width_part}<…<%3~ %(?.%F{green}.%F{red})%#%f "
# PS1="[%{${fg[cyan]}%}%n%{$reset_color%}@%{${fg[red]}%}%m%{$reset_color%}]%1~%{${fg[yellow]}%}%#%{$reset_color%} " # PROMPT
# PS2='' # Waiting for more input.
# PS3='' # Shown in a loop started by shell's select mechanism.
# PS4='' # For debugging. When $XTRACE is enabled $PS4 is shown preceeding lines that are about to be executed. 
# RPS1=' %~' # PROMPT on the right side of the screen. Dissapears when typed over.
HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=5000
# HISTDUP=erase
HELPDIR=/usr/share/zsh/"${ZSH_VERSION}"/help

# Ranger will use these to determine the default editor
export VISUAL=nvim;
export EDITOR=nvim;
export TERMINAL=/usr/bin/alacritty # Default terminal

# Add dir to path
pathadd() {
    if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
        PATH="${PATH:+"$PATH:"}$1"
    fi
}

# User specific environment
# if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
# then
#     PATH="$HOME/.local/bin:$HOME/bin:$PATH"
# fi
pathadd "$HOME/.local/bin:$HOME/bin:"
export PATH

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"


# Zsh help

# Add custom functions to FPATH
fpath=( $HOME/.config/zsh.d/functions "${fpath[@]}" )

# Mark functions to be automatically loaded upon first reference
unalias run-help 2>/dev/null
autoload run-help
autoload -Uz run-help-sudo
autoload -Uz run-help-git
autoload -Uz run-help-aur
autoload -Uz run-help-ip
autoload -Uz run-help-docker


# Todo
autoload -Uz ztodo # options: add, del, list, clear

# Sticky notes
autoload -Uz sticky-note # options: {-b} (-l)

# User specific aliases
source $HOME/.config/zsh.d/aliases.zsh

# Keybinds
source $HOME/.config/zsh.d/keybinds.zsh

# Job-related
# source $HOME/.config/zsh.d/truefullstaq.zsh

# Plugins
source $HOME/.config/zsh.d/plugins.zsh

# Autocompletion
source $HOME/.config/zsh.d/autocompletion.zsh

# Node version manager
source /usr/share/nvm/init-nvm.sh

zstyle ':completion:*' menu select
fpath+=~/.zfunc
