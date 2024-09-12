# general options
setopt no_beep
setopt no_list_beep

# history
HISTFILE=$HOME/.zhistfile
HISTSIZE=10000
SAVEHIST=10000

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
