let g:autofdm#disable_filetypes = get(g:, 'autofdm#disable_filetypes', ['gitcommit'])

augroup autofdm
  au!
  au BufWinEnter * call s:update_foldmethod()
augroup END

function! s:update_foldmethod()
  if &buftype =~# 'terminal\|help\|prompt\|quickfix'
    return
  endif
  if !&modifiable | return | endif
  if &foldmethod =~# 'diff\|expr' | return | endif
  if index(g:autofdm#disable_filetypes, &ft) >= 0 | return | endif

  call autofdm#update()
endfunction
