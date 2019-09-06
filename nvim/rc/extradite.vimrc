" From: external.toml

" Show local commit logs on Tree view.
command! GTree :top 8 sp <bar> Extradite
command! Gtree :top 8 sp <bar> Extradite

nnoremap <silent> <a-y><a-t> :<c-u>GTree<cr>
nnoremap <silent> <a-y>t     :<c-u>GTree<cr>

function! s:my_extradite_buf_map() abort
  nnoremap <buffer> <c-s> oh
  nnoremap <buffer> <c-v> ov
  nnoremap <buffer> <c-b> ot
endfunction
augroup MyExtraditeConf
  au!
  au FileType extradite setl bt=quickfix
augroup END

" TODO: on Gitcommit with no diff on &diff buffers, show previous log.
