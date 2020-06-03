" ============================================================================
" File: autoload/GuiFont.vim
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

" save 'cpoptions' {{{
let s:save_cpo = &cpo
set cpo&vim
"}}}

function! GuiFont#resize(num, bang) abort "{{{1
  if !exists('g:GuiFont')
    echoerr ":GuiFont doesn't exists; this plugin is for neovim-qt"
    return
  endif

  " e.g., DejaVuSansMono Nerd Font:h12
  let fontname_and_size = g:GuiFont
  let pattern = '\v(.+:h)(\d+)'

  let font_name      = substitute(fontname_and_size, pattern, '\1', '')
  let prev_font_size = substitute(fontname_and_size, pattern, '\2', '')

  if empty(a:num)
    let new_font_size = g:GuiFont_resize#default_size
  else
    let new_font_size = a:bang
          \ ? abs(eval(a:num))
          \ : prev_font_size + eval(a:num)
  endif

  let resized_font = font_name . new_font_size

  exe 'GuiFont!' resized_font
endfunction

function! s:get_font_conf() abort "{{{2

  return [font_name, font_size]
endfunction

" restore 'cpoptions' {{{1
let &cpo = s:save_cpo
unlet s:save_cpo

" modeline {{{1
" vim: et ts=2 sts=2 sw=2 fdm=marker tw=79
