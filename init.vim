let g:mapleader = ','

function! s:SourceDirectory(directory)
  let s:file_pattern = $HOME.'/.config/nvim/'.a:directory.'/*'
  for s:pluginConfig in split(glob(s:file_pattern), '\n')
    execute 'source' s:pluginConfig
  endfor
endfunction

call plug#begin('~/.local/share/nvim/plugged')
Plug 'rakr/vim-one'
Plug 'jiangmiao/auto-pairs'
Plug '~/workspace/test_vim_plugin'

" Plug 'vim-scripts/Rename2'

Plug 'python-mode/python-mode', { 'branch': 'develop' }
" Plug 'lambdalisue/gina.vim'
" Plug 'ludovicchabant/vim-gutentags'
Plug 'vim-scripts/Super-Shell-Indent'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-scriptease'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'elzr/vim-json'

Plug 'vimwiki/vimwiki'
Plug 'metakirby5/codi.vim', { 'on': 'Codi' }
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }

call s:SourceDirectory('plugins')

call plug#end()

call s:SourceDirectory('custom')

" ncm2
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone
inoremap <silent> <expr> <CR> ((pumvisible() && empty(v:completed_item)) ?  "\<c-y>\<cr>" : (!empty(v:completed_item) ? "\<Plug>(neosnippet_expand_or_jump)" : "\<CR>" ))
" ncm2

let g:python2_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'
