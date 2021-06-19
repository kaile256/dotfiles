" TOML: public.toml
" Repo: kaile256/vim-snatch

cmap <C-o> <Plug>(snatch-by-register)

smap <C-y> <Plug>(snatch-by-register-ctrl-y)
smap <C-e> <Plug>(snatch-by-register-ctrl-e)

imap <expr> <C-y> pumvisible() ? '<Plug>(snatch-completion-confirm)' : '<Plug>(snatch-by-register-ctrl-y)'
imap <expr> <C-e> pumvisible() ? '<Plug>(snatch-completion-cancel)'  : '<Plug>(snatch-by-register-ctrl-e)'

imap <C-g><C-y> <Plug>(snatch-by-register-ctrl-y)
imap <C-g><C-e> <Plug>(snatch-by-register-ctrl-e)

imap <C-g><C-p> <Plug>(snatch-by-register-wincmd-p)
