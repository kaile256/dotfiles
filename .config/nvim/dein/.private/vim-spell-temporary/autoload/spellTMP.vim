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

" save 'cpoptions' {{{
let s:save_cpo = &cpo
set cpo&vim
"}}}

function! spellTMP#spell_suggestion(mode) "{{{1
  if !s:get_end_of_word(a:mode) | return | endif

  let save_view = winsaveview()

  if &spell == 0
    augroup SpelltmpDetach
      au!
      " Note: <C-c> causes neither CompleteDone nor InsertLeave.
      " Note: CursorMoved will set nospell before the completion starts.
      au InsertLeave,CompleteChanged * call s:overwrite_the_augroup()
    augroup END

    setl spell
  endif

  let s:save_completeopt = &completeopt
  setl completeopt+=menuone
  setl completeopt+=noselect

  " Note: '<C-x>s' forces to take cursor back to the last misspelled word.
  let Start_spell_suggestion = 'call feedkeys("\<C-x>s", "n")'
  exe Start_spell_suggestion

  if winsaveview() == save_view
    " Note: <C-x>s once remove current word
    let Restore_words = 'call feedkeys("\<C-n>\<C-p>", "n")'
    exe Restore_words
    return
  endif

  " FIXME: Restore cursor position esp. when `<C-x>s` moves cursor in Comment.
  call winrestview(save_view)
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
  let &completeopt = s:save_completeopt
  au! SpelltmpDetach
endfunction

function! s:get_end_of_word(mode) "{{{1
  " signs which can be inserted between chars

  let pats_word_boundary = ['\l\+', '\u\{3,}']
  let word_boundary = join(pats_word_boundary, '\|')

  let save_view = winsaveview()
  let save_lnum = line('.')
  if search(word_boundary, 'ce') != save_lnum
    echohl ErrorMsg
    echo '[SpellTmp] cannot find a word for spell check'
    echohl None
    call winrestview(save_view)
    return 0
  endif

  if a:mode =~# '[nx]'
    " startinsert will start at the left of the cursor position
    call feedkeys('a', 'n')
  endif

  return 1
endfunction

" restore 'cpoptions' {{{1
let &cpo = s:save_cpo
unlet s:save_cpo

" modeline {{{1
" vim: et ts=2 sts=2 sw=2 fdm=marker
