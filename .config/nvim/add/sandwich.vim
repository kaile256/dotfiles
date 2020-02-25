" From: motion.toml
" Repo: machakann/vim-sandwich
" Fork: kaile256/vim-sandwich
" Another: source/sandwich.vim

" Note: *sandwich-magiccharacters*
"   t/T (Tag): foo<cr> to <foo>arg</foo>
"   f/F (Function): foo<cr> to foo(arg)
"   i/I (Instant): foo<cr>end<cr>  to foo(arg)end
"
" <space>: all the successive spaces will be deleted as a pair of spaces

" TextObj "{{{1
" a text surrounded by a pair of braket or of the same characters as user input
" i.e., the text-obj followed by '(' is regarded to be surrounded by '(' and ')'
omap i* <Plug>(textobj-sandwich-query-i)*
xmap i* <Plug>(textobj-sandwich-query-i)*
omap a* <Plug>(textobj-sandwich-query-a)*
xmap a* <Plug>(textobj-sandwich-query-a)*

omap i\| <Plug>(textobj-sandwich-query-i)\|
xmap i\| <Plug>(textobj-sandwich-query-i)\|
omap a\| <Plug>(textobj-sandwich-query-a)\|
xmap a\| <Plug>(textobj-sandwich-query-a)\|

"" FIXME: make 'i.' work
"omap i. <Plug>(textobj-sandwich-query-i).
"xmap i. <Plug>(textobj-sandwich-query-i).
"omap a. <Plug>(textobj-sandwich-query-a).
"xmap a. <Plug>(textobj-sandwich-query-a).

" TextObj Literal
"" a text surrounded by a pair of literally the same characters as user input
"" i.e., the text-obj followed by '(' is regarded to be surrounded by '(' and '('
"omap <space>i <Plug>(textobj-sandwich-literal-query-i)
"xmap <space>i <Plug>(textobj-sandwich-literal-query-i)
"omap <space>a <Plug>(textobj-sandwich-literal-query-a)
"xmap <space>a <Plug>(textobj-sandwich-literal-query-a)

" into Operators "{{{1
" Mnemonic: Yield a pair of bans
nmap \y zv<Plug>(operator-sandwich-add)
nmap \Y zv<Plug>(operator-sandwich-add)iW
" Mnemonic: Dispose the bans
nmap \d zv<Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
nmap \D zv<Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)
" Mnemonic: Change the bans
nmap \c zv<Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
nmap \C zv<Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)

xmap \y <Plug>(operator-sandwich-add)
xmap \d <Plug>(operator-sandwich-delete)
xmap \c <Plug>(operator-sandwich-replace)

" with magicchars tag/func
xmap <Plug>(operator-sandwich-add-tag)  <Plug>(operator-sandwich-add)t
xmap <Plug>(operator-sandwich-add-func) <Plug>(operator-sandwich-add)f
xmap \t <Plug>(operator-sandwich-add-tag)
xmap \f <Plug>(operator-sandwich-add-func)

" TODO: make a set of operator of magicchars for nmaps;
"   Note: currently (at 02e3b6d),
"     <Plug>(operator-sandwich-add-query1st)f works without textobj at least.
"     <Plug>(operator-sandwich-add-query1st)t does *not* work with any motions.
"   Ref: machakann/vim-sandwich/autoload/sandwich.vim #34
"     you can see sandwich#magicchar#t#tag() in g:sandwich#default_recipes
"   Note: the difference between 'tag' and 'tagname'
"     in 'tag', the prompt is 'Input tag:'
"     in 'tagname', the prompt is 'Input tag name:'
nmap <Plug>(operator-sandwich-add-tag) <Plug>(operator-sandwich-add-query1st)t
nmap <Plug>(operator-sandwich-add-func) <Plug>(operator-sandwich-add-query1st)f
nmap \t zv<Plug>(operator-sandwich-add-tag)
nmap \f zv<Plug>(operator-sandwich-add-func)
