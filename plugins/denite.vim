Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins', 'on': 'Denite' }

function! s:SetupDenite()
  let s:denite_options = {
        \ 'default' : {
        \ 'winheight' : 12,
        \ 'mode' : 'insert',
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

  let s:config_files = split(glob($HOME.'/.config/nvim/plugins/*'), '\n') + split(glob($HOME.'/.config/nvim/custom/*'), '\n')

  function! MapConfigFileWithName(key, value)
    return [fnamemodify(a:value, ':t'), a:value]
  endfunction

  let s:menus = {}
  let s:menus.config = {
        \ 'description': 'configuration files'
        \ }
  let s:menus.config.file_candidates = [
        \ ['zshrc', '~/.zshrc'],
        \ ['init.vim', '~/.config/nvim/init.vim'],
        \ ] + map(s:config_files, function('MapConfigFileWithName'))
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


  call denite#custom#map(
        \ 'normal',
        \ '<C-a>',
        \ '<denite:toggle_select_all>',
        \ 'noremap'
        \)
endfunction

autocmd! User denite.nvim call s:SetupDenite()

nnoremap <C-f> :<C-u>Denite file_rec<CR>
nnoremap <C-b> :<C-u>Denite buffer<CR>
nnoremap <C-t> :<C-u>Denite file_rec -default-action=tabopen<CR>
nnoremap <C-g> :<C-u>Denite grep -auto-highlight -mode=normal<CR>
nnoremap <leader>m :<C-u>Denite menu:config<CR>
nnoremap <C-c> :<C-u>Denite menu:commands<CR>
noremap <leader>s :<C-u>Denite file_rec -input=`expand('%:r')`.spec -mode=normal -default-action=tabopen -immediately<CR>
