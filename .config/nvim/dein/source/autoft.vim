" TOML: syntax.toml
" Repo: itchyny/vim-autoft

let s:config = {
      \ 'c':    '^\s*#\s*\%(include\|define\)\>',
      \ 'diff': '^diff -',
      \ 'html': '<\%(!DOCTYPE\|html\|head\|script\)\|html',
      \ 'sh':   '^#!.*\%(\<sh\>\|\<bash\>\)\s*$',
      \ }

function! s:convert_config(config) abort
  let ret = []
  for ft in keys(a:config)
    call add(ret, {'filetype': ft, 'pattern': a:config[ft]})
  endfor
  return ret
endfunction
let g:autoft_config = s:convert_config(s:config)
delfunction s:convert_config

let g:loaded_autoft = 1
augroup autoft
  au TextChanged,InsertLeave * call s:autoft()
augroup END

function! s:autoft() abort
  if &bt !=# '' | return | endif
  if &ft !=# '' | return | endif
  silent! call autoft#set()
endfunction

