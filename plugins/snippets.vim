Plug 'Shougo/neosnippet.vim'

if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

let g:neosnippet#disable_runtime_snippets = { '_' : 1 }
let g:neosnippet#snippets_directory='~/.config/nvim/snippets/'
"let g:neosnippet#enable_completed_snippet = 1

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

