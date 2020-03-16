" From: init.vim

" type ~? to ~/
" FIXME: ignore '=~?'
noremap! <expr> ?
      \ getline('.')[col('.') - 2] ==# '~' ? '/' : '?'

let s:auto_corrects = [
      \ ['VInt', 'Vint'],
      \ ['donw', 'down'],
      \ ['endfi', 'endif'],
      \ ['markdonw', 'markdown'],
      \ ['teh', 'the'],
      \ ]
for s:key in s:auto_corrects
  " '!' is prohibited to :noreabbr though :abbr is allowed.
  exe 'inoreabbr' s:key[0] s:key[1]
  exe 'cnoreabbr' s:key[0] s:key[1]
endfor
unlet s:key s:auto_corrects
