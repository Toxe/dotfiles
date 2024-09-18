# general options
setopt no_beep
setopt no_list_beep

# what non-alphanumeric characters are also considered parts of words?
export WORDCHARS="_"    # default: *?_-.[]~=/&;!#$%^(){}<>

# history
export HISTFILE=$HOME/.zhistory
export HISTSIZE=10000
export SAVEHIST=10000

setopt hist_ignore_all_dups
setopt hist_reduce_blanks
setopt hist_save_no_dups
setopt inc_append_history
setopt no_hist_beep

# aliases
source $HOME/.zaliases

# functions
fpath=(~/.zfunctions $fpath)
autoload ${fpath[1]}/*(:t)

# completion
autoload -Uz compinit && compinit

# plugins
export ZPLUGINSDIR=~/.zplugins

plugins=(
	zsh-users/zsh-autosuggestions
	zsh-users/zsh-history-substring-search
	zdharma-continuum/fast-syntax-highlighting
	romkatv/powerlevel10k
)

plugins-load $plugins

# fzf
source <(fzf --zsh)
export FZF_DEFAULT_OPTS='--border --tmux center,75%,50%'

# key bindings
bindkey -e
bindkey '^[[1;5D' backward-word                    # Ctrl+Left
bindkey '^[[1;5C' forward-word                     # Ctrl+Right
bindkey '^K'      kill-line                        # Ctrl+K
bindkey '^U'      backward-kill-line               # Ctrl+U
bindkey '^[[3;5~' delete-word                      # Ctrl+Delete
bindkey '^H'      backward-delete-word             # Ctrl+Backspace
bindkey '^Z'      undo                             # Ctrl+Z
bindkey '^[OA'    history-substring-search-up      # Up
bindkey '^[OB'    history-substring-search-down    # Down

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
