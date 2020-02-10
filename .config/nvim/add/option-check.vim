" From: myplug.toml
" Repo: kaile256/vim-option-check

let g:opt_check#evaluable = '^[&$]'
let g:opt_check#conj_partition = ':: '

let s:partition = repeat('=', 40)

let g:opt_check#list = [
      \ ['&syn', '&ft', '&bt'],
      \ s:partition,
      \ 'FOLD',
      \ ['&fdm', '&fdt', '&fdl'],
      \ s:partition,
      \ 'FORMAT',
      \ ['&tw', '&fo'],
      \ s:partition,
      \ 'CONCEAL',
      \ ['&cole', '&cocu'],
      \ s:partition,
      \ 'PATH',
      \ '&path',
      \ s:partition,
      \ 'DEFAULT EDITOR',
      \ ['$EDITOR', '$VISUAL', '$SUDO_EDITOR'],
      \ ]

nnoremap <silent> <a-s><a-s> :<c-u>VimOptCheck<cr>
nnoremap <silent> <a-s>s     :<c-u>VimOptCheck<cr>
