" From: git.toml

command! Gbranch :Twiggy
nnoremap <silent> <a-y><a-y> :MerginalToggle<cr>

" TODO: make the buffer bt=qf.
function! s:merginal_toggle_as_qf() abort
  :MerginalToggle<bar>setl bt=quickfix<cr>
endfunction
