" From: filetype.vim

setl buflisted nonumber signcolumn= nolist fdl=0
"norm zz

cnoreabbr <silent><expr> hc (getcmdtype() == ':' && getcmdline() =~ '^hc$')? "helpclose" : 'hc'
