# general options
setopt no_beep
setopt no_list_beep

# colorize man pages
export MANPAGER="less -R --use-color -Dd+B -Duy"
export MANROFFOPT="-P -c"

# what non-alphanumeric characters are also considered parts of words?
export WORDCHARS="_"    # default: *?_-.[]~=/&;!#$%^(){}<>

# history
export HISTFILE=$HOME/.zhistory
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
fpath=(~/.zfunctions $fpath)
autoload ${fpath[1]}/*(:t)

# plugins
export ZPLUGINSDIR=~/.zplugins

plugins=(
	Aloxaf/fzf-tab
	zsh-users/zsh-autosuggestions
	zsh-users/zsh-completions
	zsh-users/zsh-history-substring-search
	zdharma-continuum/fast-syntax-highlighting
	romkatv/powerlevel10k
)

plugins-load $plugins

# plugin: fzf-tab
zstyle ':completion:*:git-checkout:*' sort false    # disable sort when completing git checkout
zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup      # use tmux popups

# fzf
source <(fzf --zsh)
export FZF_DEFAULT_OPTS='--border --tmux center,75%,50%'    # use tmux popups

# completions
fpath=($fpath $HOME/.zcompletions)
autoload -Uz compinit && compinit
zstyle ":completion:*:commands" rehash true    # automatic rehash

# aliases
source $HOME/.zaliases

# key bindings
bindkey -e
bindkey '^[[1;5D' backward-word                    # Ctrl+Left
bindkey '^[[1;5C' forward-word                     # Ctrl+Right
bindkey '^K'      kill-line                        # Ctrl+K
bindkey '^U'      backward-kill-line               # Ctrl+U
bindkey '^[[3;5~' delete-word                      # Ctrl+Delete
bindkey '^H'      backward-delete-word             # Ctrl+Backspace
bindkey '^Z'      undo                             # Ctrl+Z
bindkey '^[[3~'   delete-char                      # Delete
bindkey '^[OA'    history-substring-search-up      # Up
bindkey '^[OB'    history-substring-search-down    # Down
bindkey '^[[1~'   beginning-of-line                # Home
bindkey '^[[4~'   end-of-line                      # End

# vim: automatically install color theme
[ ! -d ~/.vim/pack/themes/start/dracula ] && (mkdir -p ~/.vim/pack/themes/start; git clone https://github.com/dracula/vim.git ~/.vim/pack/themes/start/dracula)

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
