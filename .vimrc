set nocp
set ruler
set incsearch
set showcmd
set showmatch
set showmode
set incsearch
set hlsearch
set vb t_vb=
set encoding=utf-8
set backspace=start

syntax on
filetype plugin indent on
colorscheme dracula

" Jump to last cursor position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif
endif
