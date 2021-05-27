" From: operator.toml
" Repo: machakann/vim-sandwich
" Fork: kaile256/vim-sandwich

" TextObj "{{{1
" a text surrounded by a pair of braket or of the same characters as user input
" i.e., the text-obj followed by '(' is regarded to be surrounded by '(' and ')'
" Note:
"   Direct mappings such as
"   xmap i <Plug>(textobj-sandwich-query-i)
"   omap a <Plug>(textobj-sandwich-query-a)
"   could be more complicated overwriting some default mappings like 'iW',
"   'ip', 'i(' which may be already overwritten by other plugins.

omap i<S-Space> <Plug>(textobj-sandwich-auto-i)
xmap i<S-Space> <Plug>(textobj-sandwich-auto-i)
omap a<S-Space> <Plug>(textobj-sandwich-auto-a)
xmap a<S-Space> <Plug>(textobj-sandwich-auto-a)

omap i<space> <Plug>(textobj-sandwich-query-i)<space>
xmap i<space> <Plug>(textobj-sandwich-query-i)<space>
omap a<space> <Plug>(textobj-sandwich-query-a)<space>
xmap a<space> <Plug>(textobj-sandwich-query-a)<space>

omap i <Plug>(textobj-sandwich-query-i)
xmap i <Plug>(textobj-sandwich-query-i)
omap a <Plug>(textobj-sandwich-query-a)
xmap a <Plug>(textobj-sandwich-query-a)

onoremap iw iw
xnoremap iw iw
onoremap aw aw
xnoremap aw aw

onoremap iW iW
xnoremap iW iW
onoremap aW aW
xnoremap aW aW

onoremap it it
xnoremap it it
onoremap at at
xnoremap at at

onoremap ip ip
xnoremap ip ip
onoremap ap ap
xnoremap ap ap

" TextObj Literal {{{1
"" a text surrounded by a pair of literally the same characters as user input
"" i.e., the text-obj followed by '(' is regarded to be surrounded by '(' and '('
"omap <space>i <Plug>(textobj-sandwich-literal-query-i)
"xmap <space>i <Plug>(textobj-sandwich-literal-query-i)
"omap <space>a <Plug>(textobj-sandwich-literal-query-a)
"xmap <space>a <Plug>(textobj-sandwich-literal-query-a)

" into Operators "{{{1
" Mnemonic: Yield a pair of bans
nmap \y zv<Plug>(operator-sandwich-add)
nmap \Y zv<Plug>(operator-sandwich-add)$
nmap \yy zv^<Plug>(operator-sandwich-add)$
" Mnemonic: Dispose the bans
nmap \d zv<Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
nmap \dd zv<Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)
" Mnemonic: Change the bans
nmap \r zv<Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
nmap \rr zv<Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)

xmap \y <Plug>(operator-sandwich-add)
xmap \d <Plug>(operator-sandwich-delete)
xmap \r <Plug>(operator-sandwich-replace)

" xmap \* <Plug>(operator-sandwich-add)*
" xmap \` <Plug>(operator-sandwich-add)`
" xmap \' <Plug>(operator-sandwich-add)'
" xmap \" <Plug>(operator-sandwich-add)"
" xmap \( <Plug>(operator-sandwich-add)(
" xmap \) <Plug>(operator-sandwich-add))
" xmap \< <Plug>(operator-sandwich-add)<
" xmap \> <Plug>(operator-sandwich-add)>
" xmap \[ <Plug>(operator-sandwich-add)[
" xmap \] <Plug>(operator-sandwich-add)]
" xmap \{ <Plug>(operator-sandwich-add){
" xmap \} <Plug>(operator-sandwich-add)}
" xmap \/ <Plug>(operator-sandwich-add)/

" xmap \\| <Plug>(operator-sandwich-add)\|
