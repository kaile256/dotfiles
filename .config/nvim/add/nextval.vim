" From: tool.toml
" Repo: qwertologe/nextval.vim

" TODO: Work them correct.
nmap <silent><expr> <c-a> (getline('.') =~# 'fg=# \| bg=# \| = #')? '<Plug>nextvalInc' : '<c-a>'
nmap <silent><expr> <c-x> (getline('.') =~# 'fg=# \| bg=# \| = #')? '<Plug>nextvalDec' : '<c-x>'
xmap <silent><expr> <c-a> (getline('.') =~# 'fg=# \| bg=# \| = #')? '<Plug>nextvalInc' : '<c-a>'
xmap <silent><expr> <c-a> (getline('.') =~# 'fg=# \| bg=# \| = #')? '<Plug>nextvalDec' : '<c-a>'

"nmap <silent> <c-a> <Plug>nextvalInc
"nmap <silent> <c-x> <Plug>nextvalDec
"xmap <silent> <c-a> <Plug>nextvalInc
"xmap <silent> <c-a> <Plug>nextvalDec
