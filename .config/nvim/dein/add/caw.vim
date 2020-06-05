" From: motion.toml
" Repo: tyru/caw.vim
" Another: source/caw.vim

" '^': hatpos
" Note: tildepos('~') is now hatpos
nmap \^ <Plug>(caw:hatpos:toggle:operator)
nmap \h <Plug>(caw:hatpos:toggle:operator)
xmap \^ <Plug>(caw:hatpos:toggle)
xmap \h <Plug>(caw:hatpos:toggle)
"nmap \^ <Plug>(caw:hatpos:comment:operator)
"nmap \^ <Plug>(caw:hatpos:uncomment:operator)

" '0': zeropos
nmap \0 <Plug>(caw:zeropos:toggle:operator)
xmap \0 <Plug>(caw:zeropos:toggle)
"nmap <space>nm <Plug>(caw:zeropos:comment:operator)
"nmap <space>nm <Plug>(caw:zeropos:uncomment:operator)

" '$': dollarpos
nmap \$ <Plug>(caw:dollarpos:toggle:operator)
nmap \l <Plug>(caw:dollarpos:toggle:operator)
xmap \$ <Plug>(caw:dollarpos:toggle)
xmap \l <Plug>(caw:dollarpos:toggle)
"nmap \$ <Plug>(caw:dollarpos:comment:operator)
"nmap \$ <Plug>(caw:dollarpos:uncomment:operator)

nmap \% <Plug>(caw:wrap:toggle:operator)
" nmap <space>nm <Plug>(caw:wrap:uncomment:operator)
" nmap <space>nm <Plug>(caw:wrap:comment:operator)

nmap \b <Plug>(caw:box:comment:operator:operator)

" Start Insert with comment-string
" nmap \O <Plug>(caw:jump:comment-prev:operator)
" nmap \o <Plug>(caw:jump:comment-next:operator)

finish
" Deprecated named <Plug>s {{{1
"nmap <space>nm <Plug>(caw:a:toggle:operator)
"nmap <space>nm <Plug>(caw:a:comment:operator)
"nmap <space>nm <Plug>(caw:a:uncomment:operator)
"nmap <space>nm <Plug>(caw:I:toggle:operator)
"nmap <space>nm <Plug>(caw:I:comment:operator)
"nmap <space>nm <Plug>(caw:I:uncomment:operator)
"nmap <space>nm <Plug>(caw:i:toggle:operator)
"nmap <space>nm <Plug>(caw:i:comment:operator)
"nmap <space>nm <Plug>(caw:i:uncomment:operator)

