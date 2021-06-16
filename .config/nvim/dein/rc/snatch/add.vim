" TOML: public.toml
" Repo: kaile256/vim-snatch

cmap <C-o> <Plug>(snatch-operator)

smap <C-y> <Plug>(snatch-oneshot-hor-or-reg-ctrl-y)
smap <C-e> <Plug>(snatch-oneshot-hor-or-reg-ctrl-e)

imap <expr> <C-y> pumvisible() ? '<Plug>(snatch-completion-confirm)' : '<Plug>(snatch-oneshot-hor-or-reg-ctrl-y)'
imap <expr> <C-e> pumvisible() ? '<Plug>(snatch-completion-cancel)' : '<Plug>(snatch-oneshot-hor-or-reg-ctrl-e)'

imap <C-g><C-y> <Plug>(snatch-oneshot-hor-or-reg-ctrl-y)
imap <C-g><C-e> <Plug>(snatch-oneshot-hor-or-reg-ctrl-e)
