export XDG_CACHE_HOME=$HOME/.cache
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state

# just call .bashrc
if [[ -f ~/.bashrc ]]; then
    . ~/.bashrc
fi
