" Syntax: syntax/java.vim

augroup myJava
  au!
  au BufWritePre *.java call s:class_automation()
augroup END

function! s:class_automation() abort
  let cls_name = expand('%:t:r')
  if ! search(cls_name, 'wcn')
    startinsert
    exe 'public class' cls_name "{\n}"
    stopinsert
    norm! k
  endif

  let match = 'public class \zs\+ \ze {'
  silent! exe 'keeppatterns 0,10s;'. match .';'. cls_name
endfunction

