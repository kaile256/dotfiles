" ============================================================================
" Repo: kaile256/vim-yaml-fold
" File: autoload/yamlfold/headers.vim
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

if exists('g:loaded_yamlfold_headers') | finish | endif
let g:loaded_yamlfold_headers = 1

" save 'cpoptions' {{{
let s:save_cpo = &cpo
set cpo&vim
"}}}

function! s:return(ret, append) abort
  if g:yamlfold#debug#enable
    call add(s:msg, a:append .'.')
    call yamlfold#debug#_leave_log(a:ret, s:msg)
  endif

  return a:ret
endfunction

function! yamlfold#headers#expr() abort
  let s:msg = ['headers']
  let line = getline(v:lnum)
  let patterns = get(b:, 'yamlfold_headers',
        \ get(g:yamlfold#headers, &ft, [])
        \ )

  for pat in patterns
    if line =~# pat
      " TODO: adjust foldlevel on repeated patterns like markdown's header
      return s:return('>1', 'start')
    endif
  endfor

  return s:return('=', 'in_block')
endfunction

" restore 'cpoptions' {{{1
let &cpo = s:save_cpo
unlet s:save_cpo

" modeline {{{1
" vim: expandtab tabstop=2 softtabstop=2 shiftwidth=2
" vim: foldmethod=marker textwidth=79

