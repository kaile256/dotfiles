" Syntax: syntax/java.vim

finish

augroup myJava
  au!
  " au BufWritePre *.java call s:class_automation()
  au BufWritePre *.java call s:complete_semicolon()
augroup END

" function! s:class_automation() abort "{{{1
"   let cls_name = expand('%:t:r')
"   "if ! search(cls_name, 'wcn')
"   "  let text = 'public class'. cls_name ."{\n}"
"   "  exe 'norm! i'. text
"   "endif

"   let match = 'public class \zs\+ \ze {'
"   silent! exe 'keeppatterns 0,10s;'. match .';'. cls_name
" endfunction

function! s:complete_semicolon() abort "{{{1
  if &gdefault
    setl nogdefault
    let is_gdefault_on = 1
  endif

  " FIXME
  " Note: '\@!' in a pattern fails; split it
  " silent! keeppatterns g/)\s*;\@!$/if line =~# '\<if\s*' | norm! A

  if exists('is_gdefault_on')
    setl gdefault
  endif

  " let line = getline('.')
  " if line =~# ');\@!$'
  "   norm! A;
  " endif
endfunction
