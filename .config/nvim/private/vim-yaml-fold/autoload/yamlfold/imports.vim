" save 'cpoptions' {{{
let s:save_cpo = &cpo
set cpo&vim
"}}}1

function! s:return(ret, msg) abort
  if g:yamlfold#debug#enable
    call s:msg_append(a:msg)
    call yamlfold#debug#_leave_log(a:ret, s:msg)
  endif

  return a:ret
endfunction

function! s:msg_append(append) abort
  let s:msg .= '/'. a:append
endfunction

function! yamlfold#imports#expr() abort
  let s:msg = 'imports'

  if v:lnum == line('$')
    " for the next update of 'foldexpr'
    unlet b:yamlfold__in_importblock
    return s:return('=', 'End_Of_File')
  endif

  " Note: only check the *first* import-block in a file, i.e., always return
  "   '=' if the line is before or after import-block.
  if get(b:, 'yamlfold__in_importblock', 1) != 1
    return s:return('=', 'not_in_importblock')
  endif

  for pat in b:yamlfold_imports
    if g:yamlfold#_line !~# pat | continue | endif

    if !exists('b:yamlfold__in_importblock')
      let b:yamlfold__in_importblock = 1
      return s:return('>1', 'start_importblock')
    endif

    " i.e., if pat is the last item in b:yamlfold_imports, the line is in
    "   import-block.
    if index(b:yamlfold_imports, pat) == len(b:yamlfold_imports)
      return s:return('=', 'after_importblock')
    endif
  endfor

  if g:yamlfold#_line =~# g:yamlfold#_blankline
        \ && getline(v:lnum + 1) !~# '^\s*$'
    return s:return('=', 'blankline_before_end_of_importblock')
  endif

  let b:yamlfold__in_importblock = 0
  return s:return('<1', 'end_of_importblock')
endfunction

" restore 'cpoptions' {{{1
let &cpo = s:save_cpo
unlet s:save_cpo

" modeline {{{1
" vim: et ts=2 sts=2 sw=2 fdm=marker tw=79
