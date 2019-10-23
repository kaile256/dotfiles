" ============================================================================
" File: autoload/fontResize.vim
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

if exists('g:loaded_fontResize')  | finish | endif
let g:loaded_fontResize = 1

" save 'cpoptions' {{{
let s:save_cpo = &cpo
set cpo&vim
"}}}

function fontResize#initialize() abort
  redir => s:fontname_and_size
  if exists('g:GuiFont')
    " e.g., SF Mono:h12
    silent! GuiFont
  else
    silent! echo &guifont
  endif
  redir END

  " TODO: case to use 'guifont', and also in Windows.
  let s:pattern        = '\v(.+:h)(\d+)'
  let s:font_name      = substitute(s:fontname_and_size, s:pattern, '\1', '')
  let s:prev_font_size = substitute(s:fontname_and_size, s:pattern, '\2', '')

  if exists('g:GuiFont')
    " e.g., SF Mono:h12
    let s:font_set_cmd = 'GuiFont! '
  else
    let s:font_set_cmd = 'set guifont='
  endif
endfunction

function! fontResize#number(num) abort
  if exists('*fontResize#initialize')
    call fontResize#initialize()
    call feedkeys('delfunction! fontResize#initialize', 'n')
  endif

  " TODO: set font size as specified, w/o '+'.
  exe 'let s:new_font_size = s:prev_font_size +'. a:num
  let s:resized_font = s:font_name . s:new_font_size
  " Note: in the case using 'set guifont=', forbid any white space here.
  exe s:font_set_cmd . s:resized_font
endfunction

" restore 'cpoptions' {{{
let &cpo = s:save_cpo
unlet s:save_cpo
"}}}
