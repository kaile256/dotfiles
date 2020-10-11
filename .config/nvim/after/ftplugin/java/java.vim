" Syntax: syntax/java.vim

compiler javac

augroup myJavaFtplugin
  au!
  " au BufWritePre *.java call s:class_automation()
  " FIXME: make it work
  au InsertLeave *.java call s:complete_semicolon()
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
  if getline('.') =~# ';\s*$' | return | endif

  if &gdefault
    setl nogdefault
    let is_gdefault_on = 1
  endif

  call s:append_semicolon()

  if exists('is_gdefault_on')
    setl gdefault
  endif

endfunction

function! s:append_semicolon() abort "{{{1
  let line = getline('.')
  if line =~# '^package\|^import'
    silent! keeppatterns s/[^;]\zs\s*$/;/
  endif
endfunction
