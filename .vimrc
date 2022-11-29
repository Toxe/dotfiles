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

syntax on
filetype on

" Jump to last cursor position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif
endif
