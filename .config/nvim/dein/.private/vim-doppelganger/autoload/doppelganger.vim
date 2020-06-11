" ============================================================================
" Repo: kaile256/vim-doppelganger
" File: autoload/doppelganger.vim
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

let g:doppelganger#max_offset = get(g:, 'doppelganger#max_offset', 300)

let s:pairs = [
      \ ['{', '}$'],
      \ ['(', ')$'],
      \ ['[', ']$']
      \ ]
let s:namespace = nvim_create_namespace('doppelganger')
let s:search_flags_mobile = 'Wbz'
let s:search_flags_unmove = 'nWbz'

function! doppelganger#create(line1, line2) abort "{{{1
  let save_view = winsaveview()
  call nvim_buf_clear_namespace(0, s:namespace, 1, -1)

  " Search upward from a line under the bottom of window (by an offset).
  let cur_lnum = s:get_bottom_lnum(a:line2)
  let stop_lnum = s:get_top_lnum(a:line1)
  while cur_lnum > stop_lnum
    let the_pair = s:get_the_outermost_pair_in_the_line(cur_lnum)
    if the_pair == [] | continue | endif
    let pat_close = the_pair[1]
    let text = s:get_pos_open(pat_close)
    call s:set_doppelganger(cur_lnum, text)
    let cur_lnum = s:get_nextlnum(cur_lnum)
    exe cur_lnum
  endwhile
  call winrestview(save_view)
endfunction

function! s:get_bottom_lnum(lnum) abort "{{{1
  let foldend = foldclosedend(a:lnum)
  let lnum = foldend == -1 ? a:lnum : foldend
  let offset = min([g:doppelganger#max_offset, line('$') - line(foldend)])
  return lnum + offset
endfunction

function! s:get_top_lnum(lnum) abort "{{{1
  " stop side like '{'
  let foldstart = foldclosed(a:lnum)
  let lnum = foldstart == -1 ? a:lnum : foldstart
  let offset = min([g:doppelganger#max_offset, line('$') - line(foldstart)])
  return lnum - offset
endfunction

function! s:get_the_outermost_pair_in_the_line(lnum) abort "{{{1
  let line = getline(a:lnum)
  let biggest_match_col = -1
  let the_pair = []

  for p in s:pairs
    let col = -1
    while 1
      let col = matchend(line, p[1], col)
      if col == -1
        break
      elseif col > biggest_match_col
        let biggest_match_col = col
        let the_pair = p
      endif
    endwhile
  endfor

  return the_pair
endfunction

function! s:get_start_of_pair(pat_end) abort "{{{1
  return getline(s:get_pos_open(a:pat_end)[0])
endfunction

function! s:get_pos_open(pat_end) abort "{{{1
  " Assume it's the *start* of pair when we get the same pos of pat_end twice.

  let save_ignorecase = &ignorecase
  set noignorecase
  while cur_match_pos
    let cur_match_pos = searchpos(a:pat_end, s:search_flags_unmove)
    if cur_match_pos == last_match_pos
      let &ignorecase = save_ignorecase
      return cur_match_pos
    endif
    let last_match_pos = cur_match_pos
  endwhile
endfunction

function! s:get_nextlnum(lnum) abort "{{{1
  let foldstart = foldclosed(a:lnum - 1)
  let next = foldstart == -1 ? a:lnum - 1 : foldstart
  return next
endfunction

function! s:set_doppelganger(lnum, text) abort "{{{1
  let text = substitute(a:text, s:p[0], '', 'e')
  if text ==# '' | return | endif

  let chunks = [[text, 'Comment']]
  call nvim_buf_set_virtual_text(
        \ 0,
        \ s:namespace,
        \ a:lnum,
        \ chunks,
        \ {}
        \ )
endfunction

" restore 'cpoptions' {{{1
let &cpo = s:save_cpo
unlet s:save_cpo

" modeline {{{1
" vim: et ts=2 sts=2 sw=2 fdm=marker tw=79
