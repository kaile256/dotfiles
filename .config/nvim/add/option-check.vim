" From: myplug.toml
" Repo: kaile256/vim-option-check

let g:opt_check#list = [
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
      \ '&fo',
      \
      \ 'CONCEAL',
      \ '&cole',
      \ '&cocu',
      \ ]

let g:opt_check#partition = repeat('=', 20)

nnoremap <silent> <a-s><a-s> :<c-u>VimOptCheck<cr>
nnoremap <silent> <a-s>s     :<c-u>VimOptCheck<cr>
