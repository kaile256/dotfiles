" From: tool.toml

nmap <silent><expr> <c-a> (getline('.') =~# 'fg=#\|bg=#')? <Plug>nextvalInc : '<c-x>'
nmap <silent><expr> <c-x> (getline('.') =~# 'fg=#\|bg=#')? <Plug>nextvalDec : '<c-x>'

xmap <silent><expr> <c-a> (getline('.') =~# 'fg=#\|bg=#')? <Plug>nextvalInc : '<c-a>'
xmap <silent><expr> <c-a> (getline('.') =~# 'fg=#\|bg=#')? <Plug>nextvalDec : '<c-a>'
