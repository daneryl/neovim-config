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

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-scriptease'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-eunuch'

Plug 'vimwiki/vimwiki'
Plug 'metakirby5/codi.vim', { 'on': 'Codi' }
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }

call s:SourceDirectory('plugins')

call plug#end()

call s:SourceDirectory('custom')

let g:python2_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'
