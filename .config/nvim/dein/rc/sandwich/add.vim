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

" Mnemonic: Global
omap ig <Plug>(textobj-sandwich-auto-i)
xmap ig <Plug>(textobj-sandwich-auto-i)
omap ag <Plug>(textobj-sandwich-auto-a)
xmap ag <Plug>(textobj-sandwich-auto-a)

omap i<space> <Plug>(textobj-sandwich-query-i)<space>
xmap i<space> <Plug>(textobj-sandwich-query-i)<space>
omap a<space> <Plug>(textobj-sandwich-query-a)<space>
xmap a<space> <Plug>(textobj-sandwich-query-a)<space>

omap i* <Plug>(textobj-sandwich-query-i)*
xmap i* <Plug>(textobj-sandwich-query-i)*
omap a* <Plug>(textobj-sandwich-query-a)*
xmap a* <Plug>(textobj-sandwich-query-a)*

omap i\| <Plug>(textobj-sandwich-query-i)\|
xmap i\| <Plug>(textobj-sandwich-query-i)\|
omap a\| <Plug>(textobj-sandwich-query-a)\|
xmap a\| <Plug>(textobj-sandwich-query-a)\|

omap i/ <Plug>(textobj-sandwich-query-i)/
xmap i/ <Plug>(textobj-sandwich-query-i)/
omap a/ <Plug>(textobj-sandwich-query-a)/
xmap a/ <Plug>(textobj-sandwich-query-a)/

omap i# <Plug>(textobj-sandwich-query-i)#
xmap i# <Plug>(textobj-sandwich-query-i)#
omap a# <Plug>(textobj-sandwich-query-a)#
xmap a# <Plug>(textobj-sandwich-query-a)#

omap i: <Plug>(textobj-sandwich-query-i):
xmap i: <Plug>(textobj-sandwich-query-i):
omap a: <Plug>(textobj-sandwich-query-a):
xmap a: <Plug>(textobj-sandwich-query-a):

omap i; <Plug>(textobj-sandwich-query-i);
xmap i; <Plug>(textobj-sandwich-query-i);
omap a; <Plug>(textobj-sandwich-query-a);
xmap a; <Plug>(textobj-sandwich-query-a);

omap i. <Plug>(textobj-sandwich-query-i).
xmap i. <Plug>(textobj-sandwich-query-i).
omap a. <Plug>(textobj-sandwich-query-a).
xmap a. <Plug>(textobj-sandwich-query-a).

omap i_ <Plug>(textobj-sandwich-query-i)_
xmap i_ <Plug>(textobj-sandwich-query-i)_
omap a_ <Plug>(textobj-sandwich-query-a)_
xmap a_ <Plug>(textobj-sandwich-query-a)_

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
" Mnemonic: Dispose the bans
nmap \d zv<Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
nmap \D zv<Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)
" Mnemonic: Change the bans
nmap \r zv<Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
nmap \R zv<Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)

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

" Magic characters {{{1
" Note: *sandwich-magiccharacters*
"   t/T (Tag): foo<cr> to <foo>arg</foo>
"   f/F (Function): foo<cr> to foo(arg)
"   i/I (Instant): foo<cr>end<cr>  to foo(arg)end

omap if <Plug>(textobj-sandwich-query-i)f
xmap if <Plug>(textobj-sandwich-query-i)f
omap af <Plug>(textobj-sandwich-query-a)f
xmap af <Plug>(textobj-sandwich-query-a)f

omap iF <Plug>(textobj-sandwich-query-i)F
xmap iF <Plug>(textobj-sandwich-query-i)F
omap aF <Plug>(textobj-sandwich-query-a)F
xmap aF <Plug>(textobj-sandwich-query-a)F

omap it <Plug>(textobj-sandwich-query-i)t
xmap it <Plug>(textobj-sandwich-query-i)t
omap at <Plug>(textobj-sandwich-query-a)t
xmap at <Plug>(textobj-sandwich-query-a)t

omap iT <Plug>(textobj-sandwich-query-i)T
xmap iT <Plug>(textobj-sandwich-query-i)T
omap aT <Plug>(textobj-sandwich-query-a)T
xmap aT <Plug>(textobj-sandwich-query-a)T

