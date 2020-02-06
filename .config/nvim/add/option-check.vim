" From: myplug.toml
" Repo: kaile256/vim-option-check

let g:opt_check#evaluable = '^[&$]'

let s:partition = repeat('=', 20)

let g:opt_check#list = [
      \ '&syn',
      \ '&ft',
      \ '&bt',
      \ s:partition,
      \ 'FOLD',
      \ '&fdm',
      \ '&fdl',
      \ s:partition,
      \ 'FORMAT',
      \ '&tw',
      \ '&fo',
      \ s:partition,
      \ 'CONCEAL',
      \ '&cole',
      \ '&cocu',
      \ s:partition,
      \ 'DEFAULT EDITOR',
      \ '$EDITOR',
      \ '$VISUAL',
      \ '$SUDO_EDITOR',
      \ ]

nnoremap <silent> <a-s><a-s> :<c-u>VimOptCheck<cr>
nnoremap <silent> <a-s>s     :<c-u>VimOptCheck<cr>
