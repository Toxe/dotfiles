umask 022

export ZDOTDIR=$HOME/.config/zsh    # $XDG_CONFIG_HOME isn't available yet

[[ -d $HOME/bin ]] && path=($HOME/bin $path)
