" From: init.vim

setl buflisted nonumber signcolumn= nolist
"norm zz

cnoreabbr <silent><expr> hc (getcmdtype() == ':' && getcmdline() =~ '^hc$')? "helpclose" : 'hc'
