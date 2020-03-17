" ============================================================================
" Repo: kaile256/vim-yaml-fold
" File: autoload/yamlfold.vim
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

let s:styles = ['imports', 'pairs']

function! yamlfold#activate() abort "{{{1
  setlocal foldexpr=yamlfold#expr()
  setlocal foldmethod=expr
endfunction

function! yamlfold#expr() abort "{{{1
  call yamlfold#init#line()
  return s:foldexpr_in_order()
endfunction

function! s:foldexpr_in_order() abort "{{{2
  let ret = '='

  if !get(b:, 'yamlfold_disable_headers', g:yamlfold#disable_headers)
    let ret = (ret ==# '=') ? yamlfold#header#expr() : ret
  endif

  if !get(b:, 'yamlfold_disable_pairs', g:yamlfold#disable_pairs)
    let ret = (ret ==# '=') ? yamlfold#pairs#expr() : ret
  endif
  if exists('b:yamlfold__in_pairblock') | return ret | endif

  if !get(b:, 'yamlfold_disable_imports', g:yamlfold#disable_imports)
    let ret = (ret ==# '=') ? yamlfold#imports#expr() : ret
  endif

  if !get(b:, 'yamlfold_disable_indent', g:yamlfold#disable_indent)
    let ret = (ret ==# '=') ? yamlfold#indent#expr()  : ret
  endif

  return ret
endfunction

" restore 'cpoptions' {{{1
let &cpo = s:save_cpo
unlet s:save_cpo

" modeline {{{1
" vim: et ts=2 sts=2 sw=2 fdm=marker tw=79
