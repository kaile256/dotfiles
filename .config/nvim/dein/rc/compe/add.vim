" TOML: insert.toml
" Repo: hrsh7th/nvim-compe

inoremap <silent><expr> <C-n> pumvisible() ? '<C-n>' : compe#complete()
inoremap <silent><expr> <C-p> pumvisible() ? '<C-p>' : compe#complete()
inoremap <silent><expr> <CR>  compe#confirm(lexima#expand('<lt>CR>', 'i'))
inoremap <silent><expr> <C-e> compe#close('<C-e>')

inoremap <silent><expr> <C-f> pumvisible()
      \ ? compe#scroll({ 'delta': +4 })
      \ : '<C-g>U<Right>'
inoremap <silent><expr> <C-d> pumvisible()
      \ ? compe#scroll({ 'delta': -4 })
      \ : '<C-g>U<Del>'
