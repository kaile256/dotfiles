" ============================================================================
" Repo: kaile256/vim-option-check
" File: autoload/opt_check.vim
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
"}}}

function! opt_check#echo(list) abort
  echohl None
  for l:val in a:list
    if type(l:val) == type([])
      call s:echo_in_oneline(l:val)
      continue
    endif

    try
      let eval = eval(l:val)
    catch
      call s:echo_partition(l:val)
      continue
    endtry

    " echo individual
    let opt = type(eval) != type(1) ? string(eval) : eval
    let format = l:val .' is '. opt
    echo format
  endfor
endfunction

function! s:echo_in_oneline(list) abort "{{{1
  for l:val in a:list
    try
      let eval = eval(l:val)
      let opt = type(eval) != type(1) ? string(eval) : eval

      let conj = g:opt_check#conj_evaluable
      " set format in g:eval_check#format
      let format = l:val .' is '. opt
    catch /^Vim\%((\a\+)\)\=:E15/
      let conj = g:opt_check#conj_partition
      let format = l:val
    endtry

    if index(a:list, l:val) == len(a:list) - 1
      let ret = exists('ret') ? ret . format : format
    else
      let ret = exists('ret') ? ret . format . conj : format . conj
    endif
  endfor

  echo ret
endfunction

function! s:echo_partition(val) abort "{{{1
  " regard val as a title/partition
  echohl Statement
  echo a:val
  echohl None
endfunction

" restore 'cpoptions' {{{1
let &cpo = s:save_cpo
unlet s:save_cpo

" modeline {{{1
" vim: et ts=2 sts=2 sw=2 fdm=marker tw=79
