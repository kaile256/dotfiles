setlocal concealcursor=nvc
setlocal nonumber signcolumn= bufhidden=wipe

wincmd =
let &l:path = getbufvar('#', '&path')

