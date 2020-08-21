" TOML: appearance.toml
" Repo: DougBeney/pickachu

inoremap <silent> <SID>(insert-pick-color)
      \ <C-o>:<C-u>call <SID>insert_pick_color()<CR>
imap <C-x>c <SID>(insert-pick-color)

function! s:insert_pick_color() abort
  let save_line = getline('.')
  let save_view = winsaveview()
  if col('.') < col('$') - 1
    norm! h
  endif
  Pickachu
  call winrestview(save_view)

  if save_line == getline('.') | return | endif

  norm! 7la
endfunction
