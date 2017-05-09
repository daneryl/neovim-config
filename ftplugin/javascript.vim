function! JSDebugInlineArrowFunction()
    normal f>wvf)S}af)akIreturn A;Oconsole.log();b
endfunction

nnoremap <leader>d :call JSDebugInlineArrowFunction()<CR>

function! JSAddDonetoJasmineIT()
    normal ? it('$F)idone
endfunction

nnoremap <leader>it :call JSAddDonetoJasmineIT()<CR>
