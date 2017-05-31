" contro-s saving
noremap <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <C-O>:update<CR><ESC>

"Deactivate hl from las search
nnoremap <SPACE> :noh<CR>
inoremap <leader><leader> <ESC>

noremap <C-j> 5j
noremap <C-k> 5k

let mapleader = ","
nmap <leader>q :q<CR>
nmap <leader>f <S-v>f{%
nmap <leader>b :bufdo %s#..#..#gec \| update
"nmap <leader>f <S-v>/{<cr>%
"
"copy to system clipboard (osx)
vnoremap <C-y> "*y
"paste from system clipbard
noremap <leader>p "*p
