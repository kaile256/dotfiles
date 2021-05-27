" TOML: insert.toml
" Repo: hrsh7th/nvim-compe

inoremap <silent><expr> <C-n> pumvisible() ? '<C-n>' : compe#complete()
inoremap <silent><expr> <C-p> pumvisible() ? '<C-p>' : compe#complete()

if dein#tap('vim-snatch')
  imap <silent><expr> <C-e>
        \ compe#close("\<lt>Plug>(snatch-oneshot-hor-or-reg-ctrl-e)")
  imap <silent><expr> <C-y>
        \ compe#confirm("\<lt>Plug>(snatch-oneshot-hor-or-reg-ctrl-y)")
else
  inoremap <silent><expr> <C-e> compe#close('<C-e>')
  inoremap <silent><expr> <C-y> compe#confirm('<C-y>')
endif

inoremap <silent><expr> <C-f> pumvisible()
      \ ? compe#scroll({ 'delta': +4 })
      \ : '<C-g>U<Right>'
inoremap <silent><expr> <C-d> pumvisible()
      \ ? compe#scroll({ 'delta': -4 })
      \ : '<C-g>U<Del>'
