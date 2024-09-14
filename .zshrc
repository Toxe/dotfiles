# general options
setopt no_beep
setopt no_list_beep

# history
HISTFILE=$HOME/.zhistory
HISTSIZE=10000
SAVEHIST=10000

setopt hist_ignore_all_dups
setopt hist_reduce_blanks
setopt hist_save_no_dups
setopt inc_append_history
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
