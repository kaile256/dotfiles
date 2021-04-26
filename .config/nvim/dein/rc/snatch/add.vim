" TOML: public.toml
" Repo: kaile256/vim-snatch

let g:snatch#no_default_mappings = 1

cmap <C-o> <Plug>(snatch-operator)

inoremap <SID>(C-y) <C-y>
inoremap <SID>(C-e) <C-e>
imap <expr> <C-y> pumvisible() ? '<SID>(C-y)' : '<Plug>(snatch-oneshot-hor-or-reg-ctrl-y)'
imap <expr> <C-e> pumvisible() ? '<SID>(C-e)' : '<Plug>(snatch-oneshot-hor-or-reg-ctrl-e)'

smap <C-y> <Plug>(snatch-oneshot-hor-or-reg-ctrl-y)
smap <C-e> <Plug>(snatch-oneshot-hor-or-reg-ctrl-e)

