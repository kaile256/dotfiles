" From: external.toml

" Show local commit logs on Tree view.
command! GTree :above 8 sp <bar> Extradite
command! Gtree :above 8 sp <bar> Extradite

function! s:my_extradite_buf_map() abort
  nnoremap <buffer> <c-s> oh
  nnoremap <buffer> <c-v> ov
  nnoremap <buffer> <c-b> ot
endfunction
augroup MyExtraditeConf
  au!
  au FileType extradite setl bt=quickfix
augroup END
