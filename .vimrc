" enable filetype plugin
filetype plugin indent on

" reload the file if it was updated elsewhere
set autoread

" save the file with the administrator's rights
command W w !sudo tee % > /dev/null

" show the current position
set ruler

" set the backspace to behave like it should be
set backspace=eol,start,indent

" ignore the case when searching
set ignorecase

" better case handling in searches
set smartcase

" highlight search patterns
set hlsearch

" instantly move to the occurrence when typing the search pattern
set incsearch

" don't redraw the screen while the macro is still running for performance
" purposes
set lazyredraw

" turn on magic for regular expressions
set magic

" highlight brackets matching when hovering
set showmatch

" better colors for dark terminals
set background=dark

" use UTF-8 as the standard encoding
set encoding=utf-8

" disable caching & backup files
set nobackup
set nowb
set noswapfile

" use spaces instead of tabs
set expandtab

" better tabs & indentation handling
set smarttab
set smartindent

" 1 tab = 2 spaces
set shiftwidth=2
set softtabstop=2

" always show the status bar
set laststatus=2

" always show the command
set showcmd

" enable file syntax
syntax on

" assume the terminal is in slow mode
set nottyfast

" be smart about indentation
set autoindent

" disable vi emulation
set nocompatible

set rnu
