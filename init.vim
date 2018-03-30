call plug#begin('~/.local/share/nvim/plugged')
"Plug 'chriskempson/base16-vim'
Plug 'rakr/vim-one'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-scripts/YankRing.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'itchyny/lightline.vim'
Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-repeat'
Plug 'w0rp/ale'
Plug 'sbdchd/neoformat'
Plug 'terryma/vim-expand-region'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx', { 'for': 'javascript.jsx' }
Plug 'ruanyl/vim-fixmyjs', { 'for': 'javascript.jsx' }
Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neosnippet.vim'
Plug 'vim-scripts/Rename2'
Plug 'Galooshi/vim-import-js', { 'do': 'npm install -g import-js' }
Plug 'maksimr/vim-jsbeautify', { 'do': 'npm install -g js-beautify' }

Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
Plug 'mattn/emmet-vim'

call plug#end()

filetype plugin on
filetype indent on
set ofu=syntaxcomplete#Complete
set exrc  " enable per-directory .vimrc files
set secure " disable unsafe commands in local .vimrc files
set number
"set lazyredraw
set wrap!
set expandtab
set autoindent
set cindent
set smartindent
set nofoldenable
set tabstop=2
set shiftwidth=2
set encoding=utf-8
set noswapfile
set backspace=indent,eol,start
set hlsearch
set incsearch
set ic " case insensitive search
set mouse=
set splitright
set clipboard=unnamed
"set clipboard=unnamed,unnamedplus

syntax enable
set termguicolors
set background=dark
colorscheme one

let g:python2_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

source $HOME/.config/nvim/binds.vim
source $HOME/.config/nvim/plugins.vim
