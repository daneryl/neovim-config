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

function! TestCurrentFile()
  if bufwinnr('JEST') > 0
    :only
    return
  endif
  :vsp | e term://jest --watch %:r
  :file 'JEST'
  :wincmd p
  :vertical resize +25
endfunction
nnoremap <leader>t :call TestCurrentFile()<CR>

function! TestOnlyChanges()
  if bufwinnr('JEST') > 0
    :only
    return
  endif
  :vsp | e term://jest --watch
  :file 'JEST'
  :wincmd p
  :vertical resize +25
endfunction
nnoremap <leader>T :call TestOnlyChanges()<CR>

vnoremap <leader>b :call RangeJsBeautify()<CR>
