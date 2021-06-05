" TOML: public.toml
" Repo: kaile256/vim-snatch

cmap <C-o> <Plug>(snatch-operator)

smap <C-y> <Plug>(snatch-oneshot-hor-or-reg-ctrl-y)
smap <C-e> <Plug>(snatch-oneshot-hor-or-reg-ctrl-e)

if !dein#tap('nvim-compe')
  inoremap <SID>(confirm) <C-y>
  inoremap <SID>(cancel) <C-e>
  imap <expr> <C-y> pumvisible() ? '<SID>(confirm)' : '<Plug>(snatch-oneshot-hor-or-reg-ctrl-y)'
  imap <expr> <C-e> pumvisible() ? '<SID>(cancel)' : '<Plug>(snatch-oneshot-hor-or-reg-ctrl-e)'
endif

inoremap <SID>(keep-match) <space><BS>
imap <expr> <SID>(force-to-snatch) pumvisible() ? '<SID>(keep-match)' : ''
imap <C-g><C-y> <SID>(force-to-snatch)<Plug>(snatch-oneshot-hor-or-reg-ctrl-y)
imap <C-g><C-e> <SID>(force-to-snatch)<Plug>(snatch-oneshot-hor-or-reg-ctrl-e)
