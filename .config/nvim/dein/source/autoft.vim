" TOML: syntax.toml
" Repo: itchyny/vim-autoft

let g:autoft_legacy_config = 0

let g:autoft_config = {
      \ 'c':    '^\s*#\s*\%(include\|define\)\>',
      \ 'diff': '^diff -',
      \ 'html': '<\%(!DOCTYPE\|html\|head\|script\)\|html',
      \ 'sh':   '^#!.*\%(\<sh\>\|\<bash\>\)\s*$',
      \ }

