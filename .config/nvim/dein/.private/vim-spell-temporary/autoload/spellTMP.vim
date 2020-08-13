" ============================================================================
" File: autoload/spellTMP.vim
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

" save 'cpoptions' {{{
let s:save_cpo = &cpo
set cpo&vim
"}}}

function! spellTMP#spell_suggestion(mode) "{{{1
  call s:get_end_of_word(a:mode)

  if &spell == 0
    augroup SpelltmpDetach
      au!
      " Note: <C-c> causes neither CompleteDone nor InsertLeave.
      " Note: CursorMoved will set nospell before the completion starts.
      au InsertLeave,CompleteChanged * call s:overwrite_the_augroup()
    augroup END

    setl spell
  endif

  " Note: '<C-x>s' forces to take cursor back to the last misspelled word.
  call feedkeys("\<C-x>s", 'n') " start spell-completion

  " Note: <C-x>s once remove current word
  call feedkeys("\<C-n>\<C-p>", 'n')
endfunction

function! s:overwrite_the_augroup() abort "{{{1
  " Overwrite the augroup.
  augroup SpelltmpDetach
    au!
    " CursorMoved for <C-c>
    au CompleteDone,CursorMoved * call s:detach_spell()
  augroup END
endfunction

function! s:detach_spell() abort "{{{1
  if pumvisible() | return | endif
  setl nospell
  au! SpelltmpDetach
endfunction

function! s:get_end_of_word(mode) "{{{1
  " signs which can be inserted between chars

  let pats_word_boundary = ['\l\+', '\u\{3,}']
  let word_boundary = join(pats_word_boundary, '\|')
  call search(word_boundary, 'ce')
  if a:mode =~# '[nx]'
    " startinsert will start at the left of the cursor position
    call feedkeys('a', 'n')
  endif
endfunction

" restore 'cpoptions' {{{1
let &cpo = s:save_cpo
unlet s:save_cpo

" modeline {{{1
" vim: et ts=2 sts=2 sw=2 fdm=marker
