" TOML: insert.toml
" Repo: hrsh7th/nvim-compe

inoremap <silent><expr> <C-n> pumvisible() ? '<C-n>' : compe#complete()
inoremap <silent><expr> <C-p> pumvisible() ? '<C-p>' : compe#complete()
inoremap <silent><expr> <CR>  compe#confirm(lexima#expand('<lt>CR>', 'i'))

if dein#tap('vim-snatch')
  inoremap <silent><expr> <C-e>
        \ compe#close('<lt>Plug>(snatch-oneshot-hor-or-reg-ctrl-e)')
else
  inoremap <silent><expr> <C-e> compe#close('<C-e>')
endif

inoremap <silent><expr> <C-f> pumvisible()
      \ ? compe#scroll({ 'delta': +4 })
      \ : '<C-g>U<Right>'
inoremap <silent><expr> <C-d> pumvisible()
      \ ? compe#scroll({ 'delta': -4 })
      \ : '<C-g>U<Del>'
