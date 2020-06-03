" ============================================================================
" File: plugin/GuiFont_resize.vim
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

if !exists('g:GuiFont') | finish | endif
if exists('g:loaded_GuiFont_resize') | finish | endif
let g:loaded_GuiFont_resize = 1

let g:GuiFont_resize#default_size = get(g:, 'GuiFont_resize#default_size',
      \ matchstr(g:GuiFont, ':h\zs\d\+'))

command! -bar -bang -nargs=?
      \ GuiFontResize
      \ :call GuiFont#resize(<q-args>, <bang>0)

nnoremap <silent> <Plug>(GuiFont-resize-larger)
      \ :<C-u>GuiFontResize +<C-r>=v:count1<CR><CR>
nnoremap <silent> <Plug>(GuiFont-resize-smaller)
      \ :<C-u>GuiFontResize -<C-r>=v:count1<CR><CR>
nnoremap <silent> <Plug>(GuiFont-resize-reset)
      \ :<C-u>GuiFontResize! <C-r>=g:GuiFont_resize#default_size<CR><CR>

if !get(g:, 'GuiFont_resize_no_default_mappings')
  silent! nmap <unique> + <Plug>(GuiFont-resize-larger)
  silent! nmap <unique> - <Plug>(GuiFont-resize-smaller)
endif

" restore 'cpoptions' {{{1
let &cpo = s:save_cpo
unlet s:save_cpo

" modeline {{{1
" vim: et ts=2 sts=2 sw=2 fdm=marker tw=79
