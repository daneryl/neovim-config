call plug#begin('~/.local/share/nvim/plugged')
Plug 'vim-scripts/YankRing.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'scrooloose/nerdcommenter'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'itchyny/lightline.vim'
Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-repeat'
Plug 'neomake/neomake'
Plug 'terryma/vim-expand-region'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx', { 'for': 'javascript.jsx' }
Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neosnippet.vim'
call plug#end()

filetype plugin on
filetype indent on
set ofu=syntaxcomplete#Complete
set exrc  " enable per-directory .vimrc files
set secure " disable unsafe commands in local .vimrc files
set number
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
set clipboard=unnamed

syntax enable
set background=dark
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
let g:solarized_termcolors=256
colorscheme solarized

source $HOME/.config/nvim/binds.vim
source $HOME/.config/nvim/plugins.vim

autocmd FileType javascript nnoremap <buffer> <Leader>e :call EsBeautifier()<cr>
autocmd FileType javascript vnoremap <buffer> <Leader>e :call RangeEsBeautifier()<cr>
