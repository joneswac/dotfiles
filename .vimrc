" VIM configuration
" Source: https://github.com/joneswac/dotfiles
" LOCAL CHANGES WILL BE OVERWRITTEN

" Turn on syntax highlighting
syntax on

" Show file stats
set ruler

" Blink cursor on error instead of beeping (grr)
set visualbell

" Encoding
set encoding=utf-8

" Whitespace
set wrap
set textwidth=79
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround

" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

" Mouse
set mouse=a

" Allow hidden buffers
set hidden

" Rendering
set ttyfast

" Status bar
set laststatus=2

" Color scheme
colorscheme slate

" Vim Plug -- https://github.com/junegunn/vim-plug
" First -- I will install to tool if it's missing
" https://github.com/junegunn/vim-plug/wiki/tips

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -sfLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Run PlugInstall if there are missing plugins

autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin()
  Plug 'mrk21/yaml-vim'          " hieradata
  Plug 'rodjek/vim-puppet'       " Puppet syntax highlighting
  Plug 'vim-ruby/vim-ruby'       " Facts, Ruby functions, and custom providers
  Plug 'dense-analysis/ale'      " Language Server Protocol
  Plug 'preservim/nerdtree'      " File Manager
  Plug 'vim-airline/vim-airline' " Status bar
call plug#end()

" Launch with NERDTree started
autocmd VimEnter * NERDTree