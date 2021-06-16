" TOML: insert.toml
" Repo: hrsh7th/nvim-compe

inoremap <silent><expr> <C-n> pumvisible() ? '<C-n>' : compe#complete()
inoremap <silent><expr> <C-p> pumvisible() ? '<C-p>' : compe#complete()
