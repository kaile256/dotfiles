" From: git.toml
" Repo: int3/vim-extradite

"let g:extradite_width = ''
"let g:extradite_resize = 0
let g:extradite_showhash = 1
let g:extradite_diff_split = 'bot vs'

" TODO: on Gitcommit with no diff on &diff buffers, show previous log.
function! s:my_extradite_maps() abort
  nnoremap <buffer> <c-s> oh
  nnoremap <buffer> <c-v> ov
  nnoremap <buffer> <c-b> ot
endfunction

augroup MyExtraditeConf
  au!
  au FileType extradite setl bt=nofile
  au FileType extradite call <SID>my_extradite_maps()
augroup END

