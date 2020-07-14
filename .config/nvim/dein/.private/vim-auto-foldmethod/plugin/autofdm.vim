let g:autofdm#disable_filetypes = get(g:, 'autofdm#disable_filetypes', ['gitcommit'])

augroup autofdm
  au!
  au BufWinEnter * call s:update_foldmethod()
augroup END

function! s:update_foldmethod()
  if !&foldenable | return | endif
  if !&modifiable | return | endif
  if &foldmethod =~# 'diff\|expr' | return | endif

  " " FIXME: stop update calling autofdm#update() when &ft is included in
  " " `g:autofdm#disable_filetypes`; currently the buffer always fails to open
  " " when the filetype is included `g:autofdm#disable_filetypes`.
  " if has_key(g:autofdm#disable_filetypes, &ft) | return | endif

  call autofdm#update()
endfunction
