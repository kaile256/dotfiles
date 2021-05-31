function! s:save_cursor() abort
  let s:last_id = win_getid(winnr('#'))
endfunction

function! s:restore_cursor(...) abort
  call win_gotoid(s:last_id)
endfunction

augroup myFt/GitCommit/RestoreCursor
  au!
  au BufWinLeave <buffer>
        \ call timer_start(50, expand('<SID>') .'restore_cursor')
augroup END

call s:save_cursor()
