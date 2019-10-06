" From: external.toml
" Repo: idanarye/vim-merginal

"let g:merginal_windowWidth =
"let g:merginal_windowSize =
"let g:merginal_splitType = ''
"let g:merginal_logCommitCount =

command! Gbranch :Merginal
nnoremap <silent> <a-y><a-y> :MerginalToggle<cr>

" TODO: make the buffer bt=qf.
function! s:merginal_toggle_as_qf() abort
  :MerginalToggle<bar>setl bt=quickfix<cr>
endfunction
