" ============================================================================
" Repo: kaile256/vim-toml-fold
" File: plugin/tomlfold.vim
" Author: Matthias Vogelgesang <github.com/matze>, kaile256
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

if v:version < 700 | finish | endif

if get(g:, 'loaded_tomlfold', 0) | finish | endif
let g:loaded_tomlfold = 1

" save 'cpoptions' {{{
let s:save_cpo = &cpo
set cpo&vim
"}}}

augroup IniFoldActivate
    au!
    au FileType * call tomlfold#activate()
    " to update fold in case
    au InsertLeave,TextChanged * call s:fold_update()
augroup END

function! s:fold_update() abort
    if &fdm ==# 'expr' && &fde =~# '^tomlfold#expr'
        call tomlfold#activate()
    endif
endfunction

" restore 'cpoptions' {{{1
let &cpo = s:save_cpo
unlet s:save_cpo

" modeline {{{1
" vim: expandtab tabstop=4 softtabstop=4 shiftwidth=4
" vim: foldmethod=marker
