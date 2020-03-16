" ============================================================================
" File: autoload/font/resize.vim
" Author: kaile256
" License: MIT license  {{{
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

if exists('g:loaded_font#resize') | finish | endif
let g:loaded_font#resize = 1

" save 'cpoptions' {{{
let s:save_cpo = &cpo
set cpo&vim
"}}}

function! font#resize#initialize() abort "{{{1
  redir => s:fontname_and_size
  if exists(':GuiFont') == 2
    " e.g., SF Mono:h12
    silent! GuiFont
  else
    silent! echo &guifontset
  endif
  redir END

  " TODO: case to use 'guifont', and also in Windows.
  let s:pattern        = '\v(.+:h)(\d+)'
  let s:font_name      = substitute(s:fontname_and_size, s:pattern, '\1', '')
  let s:prev_font_size = substitute(s:fontname_and_size, s:pattern, '\2', '')

  if exists(':GuiFont')
    " e.g., SF Mono:h12
    let s:font_set_cmd = 'GuiFont! '
  else
    let s:font_set_cmd = 'set guifontset='
  endif
endfunction

function! font#resize#number(num) abort "{{{1
  " TODO: set font size exactly as a:num, w/o '+'.
  let new_font_size = type(a:num) == type('')
        \ ? eval(s:prev_font_size . a:num)
        \ : a:num
  let resized_font = s:font_name . new_font_size
  " Note: in the case using 'set guifont=', forbid any white space here.
  " FIXME: E:unknown-font
  exe s:font_set_cmd . resized_font
endfunction

" restore 'cpoptions' {{{1
let &cpo = s:save_cpo
unlet s:save_cpo

" modeline {{{1
" vim: et ts=2 sts=2 sw=2 fdm=marker tw=79
