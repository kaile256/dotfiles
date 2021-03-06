" ============================================================================
" Repo: kaile256/vim-countable-s
" File: plugin/countable_s.vim
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

if exists('g:loaded_countable_s') | finish | endif
let g:loaded_countable_s = 1

" save 'cpoptions' {{{
let s:save_cpo = &cpo
set cpo&vim
"}}}

" - default s/S isn't countable
" - cl/ch only count range of motion
" - xi/Xi isn't repeatable (only repeat 'i');
" FIXME: repeat by '.' should start from 'x/X' but even with
" repeat#set("\<Plug>(the-mapping)") fails to include 'x/X' and only repeat
" inserted words.
nnoremap <silent><expr> <Plug>(countable-s)
      \ ':<C-u>call repeat#set("\<Plug>(countable-s)")'
      \ .'<Esc>x'
      \ .':<C-u> undojoin<CR>'. v:count1
      \ . (col('.') == col('$') - 1 ? 'a' : 'i')
      \ ."\<C-g>U"
nnoremap <silent><expr> <Plug>(countable-S)
      \ ':<C-u>call repeat#set("\<Plug>(countable-S)")'
      \ .'<Esc>X'
      \ .':<C-u> undojoin<CR>'. v:count1 . 'i'
      \ ."\<C-g>U"

silent! nmap <unique> s <Plug>(countable-s)
silent! nmap <unique> S <Plug>(countable-S)

" restore 'cpoptions' {{{1
let &cpo = s:save_cpo
unlet s:save_cpo

" modeline {{{1
" vim: et ts=2 sts=2 sw=2 fdm=marker tw=79
