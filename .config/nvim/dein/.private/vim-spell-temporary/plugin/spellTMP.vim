" ============================================================================
" Repo: kaile256/vim-spell-temporary
" File: plugin/spellTMP.vim
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

if v:version < 700 | finish | endif
if exists('g:loaded_spellTMP') | finish | endif
let g:loaded_spellTMP = 1

nnoremap <silent> <Plug>(spellTMP-suggestion) :<c-u>call      spellTMP#spell_suggestion('n')<cr>
xnoremap <silent> <Plug>(spellTMP-suggestion) `>:<c-u>call    spellTMP#spell_suggestion('x')<cr>
inoremap <silent> <Plug>(spellTMP-suggestion) <c-o>:<c-u>call spellTMP#spell_suggestion('i')<cr>

if !get(g:, 'spellTMP#no_default_mappings', 0)
  imap <c-x>s     <Plug>(spellTMP-suggestion)
  imap <c-x><c-s> <Plug>(spellTMP-suggestion)
  nmap gs         <Plug>(spellTMP-suggestion)
  xmap gs         <Plug>(spellTMP-suggestion)
endif
