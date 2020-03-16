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

function! yamlfold#indent#expr() abort
  let s:msg = 'indent'

  if g:yamlfold#_indent_here > g:yamlfold#_indent_below
    " Note: number in return-value after the markers, like '<', must be in ().
    "return '<'. foldlevel(prevnonblank(v:lnum - 1))
    let ret = '<'. g:yamlfold#_foldlevel_as_above
    return s:return(ret, 'right_of_below')

  elseif  g:yamlfold#_line =~# g:yamlfold#_blankline
    " Note: blankline detection must be between the others
    return s:return('=', 'blankline')

  elseif g:yamlfold#_indent_here < g:yamlfold#_indent_below
    return s:foldlevel_left_of_below()

  elseif g:yamlfold#_indent_here == 0
    return s:foldlevel_for_indent_zero()
  endif

  return s:return('=', 'PASS')
endfunction

function! s:foldlevel_left_of_below() abort "{{{1
  call s:msg_append('left_of_below')

  if g:yamlfold#_indent_here == 0
    if g:yamlfold#_indent_below == 0
      return s:return(0, 'zero')
    endif

    return s:return('>1', 'in_block')
  endif

  " Note: 'a1' works different than expected
  let ret = '>'. g:yamlfold#_foldlevel_as_here
  return s:return(ret, 'PASS')
endfunction

function! s:foldlevel_for_indent_zero() abort "{{{1
  call s:msg_append('indent_zero')

  " i.e., check the indent above, but includes blankline.
  if indent(v:lnum - 1) == 0
    " make a code-block
    return s:return('=', 'in_codeblock')
  endif

  if g:yamlfold#from_firstline == 1
        \ && line('.') == 1
    return s:return('>1', 'firstline')
  endif

  return s:return('=', 'PASS')
endfunction

" restore 'cpoptions' {{{1
let &cpo = s:save_cpo
unlet s:save_cpo

" modeline {{{1
" vim: et ts=2 sts=2 sw=2 fdm=marker tw=79
