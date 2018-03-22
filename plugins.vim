"lightline
let g:lightline = {
      \ 'component_function': {
      \   'filename': 'LightLineFilename'
      \ }
      \ }
function! LightLineFilename()
  return expand('%')
endfunction

"javcascript syntax
let g:javascript_opfirst = 1

"ale
let g:ale_change_sign_column_color = 1
let g:ale_sign_error = '💩'
let g:ale_sign_warning = '❗️'
let g:ale_fixers = {
\   'javascript': ['eslint'],
\}
"neosnippet
let g:neosnippet#disable_runtime_snippets = {
      \   '_' : 1,
      \ }
let g:neosnippet#snippets_directory='~/.config/nvim/snippets/'

"deoplete
let g:deoplete#enable_at_startup = 1
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif
"let g:deoplete#disable_auto_complete = 1
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

augroup omnifuncs
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup end

" deoplete tab-complete
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
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

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
nnoremap <C-g> :<C-u>Denite grep -auto-preview -mode=normal<CR>
nnoremap <leader>g :<C-u>DeniteCursorWord file_rec -mode=normal<CR>
nnoremap <leader>m :<C-u>Denite menu:config<CR>
noremap <C-c> :<C-u>Denite menu:commands<CR>
noremap <leader>s :<C-u>Denite file_rec -input=`expand('%:r')`.spec -mode=normal -default-action=tabopen -immediately<CR>

call denite#custom#map(
		      \ 'normal',
		      \ '<C-a>',
		      \ '<denite:toggle_select_all>',
		      \ 'noremap'
		      \)

"expand region
map K <Plug>(expand_region_expand)
