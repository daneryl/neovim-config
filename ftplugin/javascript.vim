function! JSDebugInlineArrowFunction()
    normal f>wvf)S}af)akIreturn A;Oconsole.log();b
endfunction

nnoremap <leader>d :call JSDebugInlineArrowFunction()<CR>

function! JSAddDonetoJasmineIT()
    normal ? it('$F)idone
endfunction

nnoremap <leader>it :call JSAddDonetoJasmineIT()<CR>

function! JSAddFitToJasmineIt()
    normal ?it('if
endfunction

nnoremap <leader>if :call JSAddFitToJasmineIt()<CR>

function! JSRemoveFitToJasmineIt()
  normal ?fit(?€kb'x
endfunction

nnoremap <leader>iF :call JSRemoveFitToJasmineIt()<CR>
