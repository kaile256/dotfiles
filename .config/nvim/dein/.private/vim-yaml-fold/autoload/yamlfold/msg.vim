" save 'cpoptions' {{{
let s:save_cpo = &cpo
set cpo&vim
"}}}1

function! yamlfold#msg#append() abort
  let s:msg .= '/'. a:append
endfunction

function! yamlfold#msg#return(ret, msg) abort
  if g:yamlfold#debug#enable
    call s:msg_append(a:msg)
    call yamlfold#debug#_leave_log(a:ret, s:msg)
  endif

  return a:ret
endfunction

" restore 'cpoptions' {{{1
let &cpo = s:save_cpo
unlet s:save_cpo

" modeline {{{1
" vim: et ts=2 sts=2 sw=2 fdm=marker tw=79
