call plug#begin('~/.local/share/nvim/plugged')
Plug 'rakr/vim-one'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-scripts/YankRing.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'
Plug 'justinmk/vim-sneak'
Plug 'w0rp/ale'
Plug 'sbdchd/neoformat'
Plug 'pangloss/vim-javascript', { 'for': 'javascript.jsx' }
Plug 'mxw/vim-jsx', { 'for': 'javascript.jsx' }
Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'vim-scripts/Rename2'
Plug 'Galooshi/vim-import-js', {'for': 'javascript.jsx', 'do': 'npm install -g import-js' }
Plug 'maksimr/vim-jsbeautify', {'for': 'javascript.jsx', 'do': 'npm install -g js-beautify' }

Plug 'tpope/vim-surround'
Plug 'tpope/vim-scriptease'
Plug 'tpope/vim-repeat'

Plug 'vimwiki/vimwiki'
Plug 'metakirby5/codi.vim', { 'on': 'Codi' }

Plug 'roxma/nvim-completion-manager'
Plug 'fgrsnau/ncm-otherbuf'
Plug 'Shougo/neco-vim', { 'for': 'vim' }
Plug 'Shougo/neosnippet.vim'

Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-indent'
Plug 'inside/vim-textobj-jsxattr'
Plug 'rhysd/vim-textobj-anyblock'
Plug 'kana/vim-textobj-function', { 'for' : 'vim' }
Plug 'machakann/vim-textobj-functioncall', { 'for': 'javascript.jsx' }

"Plug 'thinca/vim-textobj-function-javascript'

Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
"Plug 'mattn/emmet-vim'
"Plug 'roxma/nvim-cm-tern',  {'do': 'npm install'}
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

call plug#end()

filetype plugin on
filetype indent on
set exrc
set secure
set number
set relativenumber
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
set ignorecase
set smartcase
set mouse=
set splitright

syntax enable
set termguicolors
set background=dark
colorscheme one

let g:python2_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

source $HOME/.config/nvim/binds.vim
source $HOME/.config/nvim/plugins.vim
