umask 022

alias ls="ls --color=auto"
alias ll="ls -l"
alias vi=vim
alias grep="grep --directories=skip"
alias diff="diff --color=auto"

unset LANG
unset LS_OPTIONS

HISTCONTROL=ignoredups

export EDITOR=vim
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export PS1='\[\033[0;32m\](\h) \W \$\[\033[0m\] '

# Bash automatic completion
if [ -f /etc/bash_completion ]; then
 . /etc/bash_completion
fi

# dotfiles
alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# MacPorts
if [[ -d /opt/local/bin ]]; then export PATH="/opt/local/bin:/opt/local/sbin:$PATH"; fi

# Visual Studio Code
if [[ -f "/Applications/Visual Studio Code.app/Contents/Resources/app/bin" ]]; then export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"; fi

# Poetry
export PATH="$PATH:$HOME/.poetry/bin"

# Nix
if [[ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]]; then . $HOME/.nix-profile/etc/profile.d/nix.sh; fi
