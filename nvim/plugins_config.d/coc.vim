set updatetime=300 " shorter for CursorHold & CursorHoldI
" shorter message
" c-option: not give ins-completion-menu message.
"set shortmess+=c
set signcolumn=yes " always show signcolumns.


" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~ '\s'
endfunction
