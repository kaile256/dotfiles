" From: web.toml
" Repo: ankokumoyashi/weblio_vim

nnoremap <silent> <space>bW :Weblio expand('<cword>')<cr>
xnoremap <silent> <space>bW :Weblio getline('v')[col("'<") - 1 : col("'>")]<cr>
