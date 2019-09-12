" From: filetype.vim

setl nonumber signcolumn= nolist fdl=0
"norm zz

noreabbr <silent><expr> hc (getcmdtype() == ':' && getcmdline() =~ '^hc$')? "helpclose" : 'hc'

nnoremap <buffer> d <c-d>
nnoremap <buffer> u <c-u>

" no work
if execute('nmap du') !=# ''
  silent! nunmap <buffer> du
endif
