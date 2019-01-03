Plug 'w0rp/ale'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

let g:ale_change_sign_column_color = 1
let g:ale_sign_error = '=>'
let g:ale_sign_warning = '!>'
let g:ale_fixers = {
\   'javascript': ['eslint', 'importjs'],
\}
nmap <silent> <C-e> <Plug>(ale_next_wrap)
