" TOML: public.toml
" Repo: kaile256/vim-snatch

cmap <C-o> <Plug>(snatch-operator)

" inoremap <SID>(cancel) <C-e>
" inoremap <SID>(confirm) <C-y>
inoremap <SID>(keep-match) <space><BS>
imap <expr> <SID>(prefix) pumvisible() ? '<SID>(keep-match)' : ''
imap <C-y> <SID>(prefix)<Plug>(snatch-oneshot-hor-or-reg-ctrl-y)
imap <C-e> <SID>(prefix)<Plug>(snatch-oneshot-hor-or-reg-ctrl-e)

smap <C-y> <Plug>(snatch-oneshot-hor-or-reg-ctrl-y)
smap <C-e> <Plug>(snatch-oneshot-hor-or-reg-ctrl-e)

