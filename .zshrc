# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=1000
setopt nomatch
unsetopt autocd beep extendedglob
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/sujuka99/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Added manually
# Autoload
autoload -U colors && colors
# Options:
setopt NOTIFY
setopt PROMPT_SUBST # Allow manually setting $PS1
# setopt append_history # Append history to old
# setopt inc_append_history # Add each line to history immediately
setopt SHARE_HISTORY # Combine all shells' histories, append to old after each line.
setopt EXTENDED_HISTORY # Save time and date of commands. BREAKS OTHER SHELLS.
setopt HIST_IGNORE_DUPS # Collapse repeated commands into one.
setopt NO_HIST_BEEP # No beeping when scrolling history past the ends.
setopt TRANSIENTRPROMPT # $RPS1 doesn't show in past lines.
setopt EXTENDED_GLOB # Enable sophisticated pattern matching. BREAKS some stuff like '*'.
setopt CORRECT
# Variables:
PS1="[%{${fg[cyan]}%}%n%{$reset_color%}@%{${fg[red]}%}%m%{$reset_color%}]%1~%{${fg[yellow]}%}%#%{$reset_color%} " # PROMPT
# PS2='' # Waiting for more input.
# PS3='' # Shown in a loop started by shell's select mechanism.
# PS4='' # For debugging. When $XTRACE is enabled $PS4 is shown preceeding lines that are about to be executed. 
RPS1=' %~' # PROMPT on the right side of the screen. Dissapears when typed over.
# setopt hup # Set to leave background processes running when shell exits.
# Functions
# End of lines added manually
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME' # Alias for the bare git repository with dotfiles .cfg
