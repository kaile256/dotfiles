" From: filetype.vim

setl buflisted nonumber signcolumn= nolist fdl=0
"norm zz

noreabbr <silent><expr> hc (getcmdtype() == ':' && getcmdline() =~ '^hc$')? "helpclose" : 'hc'

nnoremap <buffer> d <c-d>
nnoremap <buffer> u <c-u>

" no work
if execute('nmap du') !=# ''
  nunmap <buffer> du
endif
