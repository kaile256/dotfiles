" From: external.toml

"let g:extradite_width = ''
"let g:extradite_resize = 0
let g:extradite_showhash = 1
let g:extradite_diff_split = 'bot vs'

" Show Local commit logs.
command! GLocalLog :bot 10 sp <bar> Extradite
command! GlocalLog :bot 10 sp <bar> Extradite

" TODO: on Gitcommit with no diff on &diff buffers, show previous log.
function! s:my_extradite_buf_map() abort
  nnoremap <buffer> <c-s> oh
  nnoremap <buffer> <c-v> ov
  nnoremap <buffer> <c-b> ot
endfunction
augroup MyExtraditeConf
  au!
  au FileType extradite setl bt=quickfix
augroup END

