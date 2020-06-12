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

hi def link DoppelGanger NonText

let g:doppelganger#max_offset = get(g:, 'doppelganger#max_offset', 300)

let s:pairs = [
      \ ['{', '},\=$'],
      \ ['(', '),\=$'],
      \ ['[', '],\=$']
      \ ]
let s:namespace = nvim_create_namespace('doppelganger')
let s:search_flags_mobile = 'Wbz'
let s:search_flags_unmove = 'nWbz'

function! doppelganger#create(upper, lower) abort "{{{1
  let save_view = winsaveview()
  call nvim_buf_clear_namespace(0, s:namespace, 1, -1)

  " Search upward from a line under the bottom of window (by an offset).
  let cur_lnum = s:get_bottom_lnum(a:lower)
  let stop_lnum = s:get_top_lnum(a:upper)
  while cur_lnum > stop_lnum
    let cur_lnum = s:set_curpos(cur_lnum, stop_lnum)
    let the_pair = s:specify_the_outermost_pair_in_the_line(cur_lnum)
    if the_pair != []
      let lnum_open = s:get_lnum_open(the_pair, stop_lnum)
      if lnum_open > stop_lnum
        let text = getline(lnum_open)
        call s:set_text_on_lnum(cur_lnum, text)
      endif
    endif
    let cur_lnum -= 1
  endwhile
  call winrestview(save_view)
endfunction

function! s:get_bottom_lnum(lnum) abort "{{{1
  let foldend = foldclosedend(a:lnum)
  let lnum = foldend == -1 ? a:lnum : foldend
  let offset = min([g:doppelganger#max_offset, line('$') - lnum])
  return lnum + offset
endfunction

function! s:get_top_lnum(lnum) abort "{{{1
  " stop side like '{'
  let foldstart = foldclosed(a:lnum)
  let lnum = foldstart == -1 ? a:lnum : foldstart
  let offset = min([g:doppelganger#max_offset, lnum])
  return lnum - offset + 1
endfunction

function! s:specify_the_outermost_pair_in_the_line(lnum) abort "{{{1
  let line = getline(a:lnum)
  " matchend() never returns 0.
  let biggest_match_col = 0
  let the_pair = []
  silent! unlet s:the_pair

  for p in s:pairs
    let match_col = 0
    while match_col != -1
      let match_col = matchend(line, p[1], match_col)
      if match_col > biggest_match_col
        let biggest_match_col = match_col
        let the_pair = p
      endif
    endwhile
  endfor

  let s:the_pair = the_pair
  return the_pair
endfunction

function! s:get_pos_open(pair_dict) abort "{{{1
  " Assume it's the *start* of pair when we get the same pos of pat_end twice.
  let pat_open = a:pair_dict[0]
  let pat_close = a:pair_dict[1]

  let save_ignorecase = &ignorecase
  set noignorecase
  let cur_pos_close  = [0, 0]
  let last_pos_close = [-1, -1]
  while cur_pos_close != last_pos_close
    let cur_pos_open = searchpos(pat_open, s:search_flags_mobile)
    let cur_pos_close = searchpos(pat_close, s:search_flags_unmove)
    let last_pos_close = cur_pos_close
  endwhile

  let &ignorecase = save_ignorecase
  return cur_pos_open
endfunction

function! s:set_curpos(lnum, stop_lnum) abort "{{{1
  let next = a:lnum
  if !s:is_inside_fold(next)
    exe next
    return next
  endif

  let save_next = next
  while s:is_inside_fold(next) || next > a:stop_lnum
    if next > 0
      let save_next = next
      let next -= 1
    endif
    let next = foldclosed(next)
  endwhile

  exe save_next
  return save_next
endfunction

function! s:is_inside_fold(lnum) abort "{{{1
  return foldclosed(a:lnum) != -1
endfunction

function! s:set_text_on_lnum(lnum, text) abort "{{{1
  let text = substitute(a:text, s:the_pair[0], '', 'e')
  if text ==# '' | return | endif

  let chunks = [[text, 'DoppelGanger']]
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
