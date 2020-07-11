" From: init.vim

" type ~/ except =~? and !~?
inoremap <expr> ?
      \ search('[=!]\@<!\~\%#', 'nbcW')
      \ ? '/' : '?'

let s:auto_corrects = [
      \ ['disabel', 'disable'],
      \ ['donw', 'down'],
      \ ['endfi', 'endif'],
      \ ['markdonw', 'markdown'],
      \ ['teh', 'the'],
      \ ['ture', 'true'],
      \ ]
for s:key in s:auto_corrects
  " '!' is prohibited to :noreabbr though :abbr is allowed.
  exe 'inoreabbr' s:key[0] s:key[1]
  exe 'cnoreabbr' s:key[0] s:key[1]
endfor
unlet s:key s:auto_corrects
