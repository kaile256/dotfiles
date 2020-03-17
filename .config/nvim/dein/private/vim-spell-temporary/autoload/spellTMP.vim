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

function! spellTMP#spell_suggestion() "{{{1
  if &spell != 1
    setl spell
    augroup SpelltmpDetach
      au!
      au CompleteDone * call s:detach_spell()
      " <C-c> causes neither CompleteDone nor InsertLeave
      au CursorMoved,CursorHold * call s:detach_spell()
    augroup END
  endif

  if mode('i') ==# 'niI'
    let i_mode = 1
  else
    call s:get_end_of_word()
  endif

  " Note: '<C-x>s' forces to take cursor back to the last misspelled word.
  call feedkeys("\<C-x>s", 'n') " start spell-completion

  " if !exists('i_mode') && get(g:, 'spellTMP#without_autoselect_in_normal', 0)
  "   call feedkeys("\<c-p>", 'n') " keep the word from being replaced at first
  " endif
endfunction

function! s:detach_spell() abort "{{{1
  setl nospell
  au! SpelltmpDetach
endfunction

function! s:get_end_of_word() "{{{1
  let col = col('.') - 1
  " signs which can be inserted between chars
  let signs = [' ', '#', '_', '.', '-', '=', '/', '[', ']', '(', ')']
  let cnt = 0

  while getline('.')[col] !=# signs[cnt]
    let cnt += 1

    if col('.') == col('$') - 1 | break | endif

    if cnt == len(signs)
      let cnt = 0
      norm! l
      break
    endif
  endwhile

  startinsert
endfunction

" restore 'cpoptions' {{{1
let &cpo = s:save_cpo
unlet s:save_cpo

" modeline {{{1
" vim: et ts=2 sts=2 sw=2 fdm=marker
