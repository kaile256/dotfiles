" ============================================================================
" Repo: kaile256/vim-option-check
" File: plugin/opt_check.vim
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

if exists('g:loaded_option_check') | finish | endif
let g:loaded_option_check = 1

" save 'cpoptions' {{{
let s:save_cpo = &cpo
set cpo&vim
"}}}

let s:partition = repeat('=', 30)

let g:opt_check#evaluable = get(g:, 'opt_check#evaluable', '^&')
let g:opt_check#conj_evaluable = get(g:, 'opt_check#conj_evaluable', '; ')
let g:opt_check#conj_partition = get(g:, 'opt_check#conj_partition', ': ')

let g:opt_check#list = get(g:, 'opt_check#list', [
      \ '&syntax',
      \ '&filetype',
      \ '&buftype',
      \ s:partition,
      \ ['FOLD', '&foldmarker', '&foldtext', '&foldlevel'],
      \ s:partition,
      \ 'FORMAT',
      \ '&textwidth',
      \ '&formatoptions',
      \ s:partition,
      \ 'CONCEAL',
      \ '&conceallevel',
      \ '&concealcursor',
      \ ])

command! -bar VimOptCheck :call opt_check#echo(g:opt_check#list)

" restore 'cpoptions' {{{1
let &cpo = s:save_cpo
unlet s:save_cpo

" modeline {{{1
" vim: expandtab tabstop=2 softtabstop=2 shiftwidth=2
" vim: foldmethod=marker textwidth=79
