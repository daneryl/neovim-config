"lightline
let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'component_function': {
      \   'filename': 'LightLineFilename'
      \ }
      \ }
function! LightLineFilename()
  return expand('%')
endfunction

let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }

let g:lightline.component_type = {
      \     'linter_checking': 'left',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'left',
      \ }

let g:lightline.active = { 'left': [
      \[ 'mode', 'paste' ],
      \[ 'filename' ],
      \[ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ]] 
      \}

"javcascript syntax
let g:javascript_opfirst = 1

"ale
let g:ale_change_sign_column_color = 1
let g:ale_sign_error = '=>'
let g:ale_sign_warning = '!>'
let g:ale_fixers = {
\   'javascript': ['eslint', 'importjs'],
\}
nmap <silent> <C-e> <Plug>(ale_next_wrap)

"neosnippet
let g:neosnippet#disable_runtime_snippets = {
      \   '_' : 1,
      \ }
let g:neosnippet#snippets_directory='~/.config/nvim/snippets/'

function! s:neosnippet_complete()
  if pumvisible()
    return "\<c-n>"
  else
    if neosnippet#expandable_or_jumpable() 
      return "\<Plug>(neosnippet_expand_or_jump)"
    endif
    return "\<tab>"
  endif
endfunction

imap <expr><TAB> <SID>neosnippet_complete()
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-K>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

"autocompletion
inoremap <expr> <CR> (pumvisible() ? "\<c-y>" : "\<CR>")
set shortmess+=c

"jsx
let g:jsx_ext_required = 0

"Denite
let s:denite_options = {
      \ 'default' : {
      \ 'winheight' : 12,
      \ 'mode' : 'insert',
      \ 'quit' : 'true',
      \ 'highlight_matched_char' : 'MoreMsg',
      \ 'highlight_matched_range' : 'MoreMsg',
      \ 'direction': 'rightbelow',
      \ 'prompt' : '➭',
      \ }}

function! s:profile(opts) abort
  for fname in keys(a:opts)
    for dopt in keys(a:opts[fname])
      call denite#custom#option(fname, dopt, a:opts[fname][dopt])
    endfor
  endfor
endfunction

call s:profile(s:denite_options)

call denite#custom#var('file_rec', 'command',
      \ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])

call denite#custom#source('grep', 'max_candidates', 100)
call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'default_opts', ['-i', '--vimgrep'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

let s:menus = {}
let s:menus.config = {
      \ 'description': 'configuration files'
      \ }
let s:menus.config.file_candidates = [
      \ ['zshrc', '~/.zshrc'],
      \ ['init.vim', '~/.config/nvim/init.vim'],
      \ ['plugins.vim', '~/.config/nvim/plugins.vim'],
      \ ['binds.vim', '~/.config/nvim/binds.vim'],
      \ ['javascript.vim', '~/.config/nvim/ftplugin/javascript.vim']
      \ ]
let s:menus.commands = {
      \ 'description': 'useful commands'
      \ }
let s:menus.commands.command_candidates = [
      \ ['source init.vim', 'so ~/.config/nvim/init.vim'],
      \ ['PlugInstall', 'PlugInstall'],
      \ ['PlugClean', 'PlugClean'],
      \ ['Edit snippets current filetype', 'NeoSnippetEdit']
      \ ]
call denite#custom#var('menu', 'menus', s:menus)

nnoremap <C-f> :<C-u>Denite file_rec<CR>
nnoremap <C-b> :<C-u>Denite buffer<CR>
nnoremap <C-t> :<C-u>Denite file_rec -default-action=tabopen<CR>
nnoremap <C-g> :<C-u>Denite grep -auto-highlight -mode=normal<CR>
nnoremap <leader>g :<C-u>DeniteCursorWord file_rec -mode=normal<CR>
nnoremap <leader>m :<C-u>Denite menu:config<CR>
nnoremap <C-c> :<C-u>Denite menu:commands<CR>
noremap <leader>s :<C-u>Denite file_rec -input=`expand('%:r')`.spec -mode=normal -default-action=tabopen -immediately<CR>

call denite#custom#map(
          \ 'normal',
          \ '<C-a>',
          \ '<denite:toggle_select_all>',
          \ 'noremap'
          \)

"expand region
map K <Plug>(expand_region_expand)
