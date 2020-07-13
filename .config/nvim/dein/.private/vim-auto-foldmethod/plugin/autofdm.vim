augroup autofdm
  au!
  au BufWinEnter * call s:update_foldmethod()
augroup END

function! s:update_foldmethod()
  if !&foldenable | return | endif
  if !&modifiable | return | endif
  if &foldmethod =~# 'diff\|expr' | return | endif

  call autofdm#update()
endfunction
