" From: external.toml

"let g:merginal_windowWidth =
"let g:merginal_windowSize =
"let g:merginal_splitType = ''
"let g:merginal_logCommitCount =

nnoremap <silent> <a-y><a-y> :MerginalToggle<cr>
command! Gbranch :Merginal

" TODO: make the buffer bt=qf.
function! s:merginal_toggle_as_qf() abort
  :MerginalToggle<bar>setl bt=quickfix<cr>
endfunction
