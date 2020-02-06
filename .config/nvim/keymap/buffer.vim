" From: nvim/init.vim

" Keymap; 'SOurce' init.vim
function! s:my_source_vimrc() abort "{{{
  if &ft ==# 'vim'
    so %
    echo ' Vim sourced "' . expand('%:t') . '"'
  else
    echo ' &ft is not "vim"!'
  endif
endfunction "}}}
nnoremap <silent> <a-s><a-o> :<c-u>call <SID>my_source_vimrc()<cr>
nnoremap <silent> <a-s>o     :<c-u>call <SID>my_source_vimrc()<cr>
