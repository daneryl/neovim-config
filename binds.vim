" contro-s saving
noremap <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <C-O>:update<CR><ESC>

"Deactivate hl from las search
nnoremap <CR> :noh<CR>

noremap <C-j> 5j
noremap <C-k> 5k

let mapleader = ","
nmap <leader>q :q<CR>
nmap <leader>f <S-v>/{<cr>%
