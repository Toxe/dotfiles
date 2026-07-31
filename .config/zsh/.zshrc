# general options
setopt no_beep
setopt no_list_beep

# colorize man pages
export MANPAGER="less -R --use-color -Dd+B -Duy"
export MANROFFOPT="-P -c"

# what non-alphanumeric characters are also considered parts of words?
export WORDCHARS="_"    # default: *?_-.[]~=/&;!#$%^(){}<>

# history
export HISTFILE=$XDG_STATE_HOME/zsh/history
export HISTSIZE=10000
export SAVEHIST=10000

setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt hist_save_no_dups
setopt inc_append_history
setopt no_hist_beep

# improve run-help for certain commands
autoload -Uz run-help-git run-help-ip run-help-sudo

# functions
fpath=($XDG_CONFIG_HOME/zsh/functions $fpath)
autoload ${fpath[1]}/*(:t)

# completions
fpath=($fpath $XDG_CONFIG_HOME/zsh/completions)

[ ! -d $XDG_CACHE_HOME/zsh ] && mkdir $XDG_CACHE_HOME/zsh
autoload -Uz compinit && compinit -d $XDG_CACHE_HOME/zsh/zcompdump
zstyle ":completion:*:commands" rehash true    # automatic rehash

setopt complete_aliases

# plugins
export ZPLUGINSDIR=$XDG_STATE_HOME/zsh/plugins

plugins=(
	Aloxaf/fzf-tab
	zdharma-continuum/fast-syntax-highlighting
	zsh-users/zsh-autosuggestions
	zsh-users/zsh-completions
	zsh-users/zsh-history-substring-search
	romkatv/powerlevel10k
)

plugins-load $plugins

# plugin: fzf-tab
zstyle ':completion:*:git-checkout:*' sort false    # disable sort when completing git checkout
zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup      # use tmux popups

# plugin: zsh-history-substring-search
export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='fg=white,bold'
export HISTORY_SUBSTRING_SEARCH_PREFIXED=true

# fzf
source <(fzf --zsh)
export FZF_DEFAULT_OPTS='--border --tmux center,75%,50%'    # use tmux popups

# aliases
source $XDG_CONFIG_HOME/zsh/aliases

# key bindings
bindkey -e
bindkey "$terminfo[kRIT5]" forward-word                   # Ctrl+Right
bindkey "$terminfo[kLFT5]" backward-word                  # Ctrl+Left
bindkey "$terminfo[kdch1]" delete-char                    # Delete
bindkey "$terminfo[kDC5]"  delete-word                    # Ctrl+Delete
bindkey "$terminfo[kbs]"   backward-delete-char           # Backspace
bindkey '^H'               backward-delete-word           # Ctrl+Backspace
bindkey '^K'               kill-line                      # Ctrl+K
bindkey '^U'               backward-kill-line             # Ctrl+U
bindkey '^Z'               undo                           # Ctrl+Z
bindkey "$terminfo[khome]" beginning-of-line              # Home
bindkey "$terminfo[kend]"  end-of-line                    # End
bindkey "$terminfo[kcuu1]" history-substring-search-up    # Up
bindkey "$terminfo[kcud1]" history-substring-search-down  # Down

# Make sure the terminal is in application mode, when zle is active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
	autoload -Uz add-zle-hook-widget
	function zle_application_mode_start { echoti smkx }
	function zle_application_mode_stop { echoti rmkx }
	add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
	add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi

# vim: automatically install color theme
[ ! -d $XDG_DATA_HOME/vim/pack/themes/start/dracula ] && (mkdir -p $XDG_DATA_HOME/vim/pack/themes/start; git clone --depth 1 https://github.com/dracula/vim.git $XDG_DATA_HOME/vim/pack/themes/start/dracula)

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/p10k.zsh.
[[ ! -f $XDG_CONFIG_HOME/zsh/p10k.zsh ]] || source $XDG_CONFIG_HOME/zsh/p10k.zsh
