" TOML: syntax.toml
" Repo: itchyny/vim-autoft
" Another: add/autoft.vim

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

