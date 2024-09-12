# general options
setopt no_beep
setopt no_list_beep

# history
HISTFILE=$HOME/.zhistfile
HISTSIZE=10000
SAVEHIST=10000

setopt append_history
setopt hist_ignore_dups
setopt hist_reduce_blanks
setopt inc_append_history
setopt share_history
setopt no_hist_beep

# key bindings
bindkey -e

# aliases
. $HOME/.zaliases

# autocompletion
autoload -Uz compinit
compinit

# prompt
autoload -Uz promptinit
promptinit
prompt walters
