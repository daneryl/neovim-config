" contro-s saving
noremap <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <C-O>:update<CR><ESC>

"Deactivate hl from last search
nnoremap <SPACE> :noh<CR>
inoremap <leader><leader> <ESC>

inoremap <c-c> <ESC>
vnoremap <c-c> <ESC>

noremap <C-j> }
noremap <C-k> {

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

