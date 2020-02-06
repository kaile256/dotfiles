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

let s:info_list = [
      \ '&syn',
      \ '&ft',
      \ '&bt',
      \
      \ 'FOLD',
      \ '&fdm',
      \ '&fdl',
      \
      \ 'FORMAT',
      \ '&tw',
      \ '&formatoptions',
      \
      \ 'CONCEAL',
      \ '&cole',
      \ ]
let s:width = 30

function! s:opt_check() abort
  let list = filter(deepcopy(s:info_list), "v:val =~# '&' ")
  let max = len(list)
  for opt in s:info_list
    try
      let l:val = eval(opt)
    catch
      let trail = repeat('=', s:width - len(opt))
      echo '==' opt trail
      continue
    endtry
    let num = index(list, opt) + 1
    let gap = repeat(' ', len(max) - len(num))
    echo gap .. num .'. '. opt 'is' l:val
  endfo
endfunction

nnoremap <silent> <a-s><a-s> :<c-u>call <SID>opt_check()<cr>
nnoremap <silent> <a-s>s     :<c-u>call <SID>opt_check()<cr>
