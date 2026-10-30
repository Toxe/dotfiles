# bare minimum only, this is a zsh house

umask 022

export EDITOR=vim
export VISUAL=vim

alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias ll="ls -l"
alias vi=vim
