" TOML: debug.toml
" Repo: tpope/vim-dispatch
" Another: source/dispatch.vim

" Note: Dispatch internally uses commands `E533: Not allowed here` for <expr>.
nnoremap <silent> `\ :<C-u>call <SID>dispatch()<CR>

function! s:dispatch() abort
  if &modified
    update
  else
    checktime
  endif

  let Dispatch = 'Dispatch -dir='. expand('%:p:h')
  " if &ft ==# 'cpp' && search('\v(low|upp)er_bound', 'nw')
  "   " Error: attempt to dereference a past-the-end iterator.
  "   exe Dispatch 'g++ %'
  "   return
  " endif

  exe Dispatch
endfunction
