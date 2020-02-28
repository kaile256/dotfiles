" From: debug.toml
" Repo: neomake/neomake
" Another: source/neomake.vim

" neomake/autoload/neomake/makers
" Availabile: w, n, r, i, number(ms)
"   w: on writing a buffer, no delay
"   r: on reading a buffer
"   n: on a change in normal mode
"   i: on a change in insert mode
"   number: set a delay in ms which works except on writing
call neomake#configure#automake('w')
