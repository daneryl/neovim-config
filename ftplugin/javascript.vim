function! JSDebugInlineArrowFunction()
    normal f>wvf)S}a
endfunction

nnoremap <leader>d :call JSDebugInlineArrowFunction()<CR>

function! JSAddDonetoJasmineIT()
    normal ? it('
endfunction

nnoremap <leader>it :call JSAddDonetoJasmineIT()<CR>