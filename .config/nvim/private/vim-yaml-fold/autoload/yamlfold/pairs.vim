" ============================================================================
" Repo: kaile256/vim-yaml-fold
" File: autoload/yamlfold/pairs.vim
" Author: kaile256
" License: MIT license {{{
"     Permission is hereby granted, free of charge, to any person obtaining
"     a copy of this software and associated documentation files (the
"     "Software"), to deal in the Software without restriction, including
"     without limitation the rights to use, copy, modify, merge, publish,
"     distribute, sublicense, and/or sell copies of the Software, and to
"     permit persons to whom the Software is furnished to do so, subject to
"     the following conditions:
"
"     The above copyright notice and this permission notice shall be included
"     in all copies or substantial portions of the Software.
"
"     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
"     OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
"     MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
"     IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
"     CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
"     TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
"     SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
" }}}
" ============================================================================

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

function! yamlfold#pairs#expr(...) abort
  let s:msg = 'pairs'

  let pairs = a:0 > 0 ? a:1 : b:yamlfold_pairs

  if type(pairs[0]) == type([])
    let ret = s:foldexpr_pairs_in_list()
    if ret !=# '='
      return ret
    endif
  endif

  let [start, end] = [pairs[0], pairs[1]]

  if !exists('b:yamlfold__in_pairblock') && g:yamlfold#_line =~# start
    let b:yamlfold__in_pairblock = 1
    " Note: 'a1' works different than expected
    let ret = '>'. g:yamlfold#_foldlevel_as_here
    return s:return(ret, 'start_pairblock')

  elseif exists('b:yamlfold__in_pairblock') && g:yamlfold#_line =~# end
    unlet b:yamlfold__in_pairblock

    let ret = '<'. g:yamlfold#_foldlevel_as_above
    return s:return(ret, 'end_of_pairblock')
  endif

  return s:return('=', 'PASS')
endfunction

function! s:foldexpr_pairs_in_list(list) abort
  call s:msg_append('list_in_list')
  for idx in a:list
    let ret = s:foldexpr_pairs(idx)
    if ret !=# '='
      return s:return(ret, 'for_loop')
    endif
  endfor

  return s:return('=', 'PASS')
endfunction

" restore 'cpoptions' {{{1
let &cpo = s:save_cpo
unlet s:save_cpo

" modeline {{{1
" vim: et ts=2 sts=2 sw=2 fdm=marker tw=79
