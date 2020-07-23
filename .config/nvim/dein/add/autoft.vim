" TOML: syntax.toml
" Repo: itchyny/vim-autoft
" Another: source/autoft.vim

let g:loaded_autoft = 1
augroup autoft
  au TextChanged,InsertLeave,CursorHold * call s:autoft()
augroup END

function! s:autoft() abort
  if &bt !=# '' | return | endif
  if &ft !=# '' | return | endif
  silent! call autoft#set()
endfunction

