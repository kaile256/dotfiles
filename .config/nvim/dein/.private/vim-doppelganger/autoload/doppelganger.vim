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

let s:namespace = nvim_create_namespace('doppelganger')

function! doppelganger#create(upper, lower) abort "{{{1
  if mode() ==? 's' | return | endif

  let save_view = winsaveview()
  call nvim_buf_clear_namespace(0, s:namespace, 1, -1)

  " Search upward from a line under the bottom of window (by an offset).
  let s:cur_lnum = s:get_bottom_lnum(a:lower)
  let stop_lnum = s:get_top_lnum(a:upper)
  while s:cur_lnum > stop_lnum
    let s:cur_lnum = s:set_curpos(stop_lnum)
    let the_pair = s:specify_the_outermost_pair_in_the_line(s:cur_lnum)
    if the_pair != []
      let lnum_open = s:get_lnum_open(the_pair, stop_lnum)
      if lnum_open > stop_lnum
        call s:set_text_on_lnum(lnum_open)
      endif
    endif
    let s:cur_lnum -= 1
  endwhile
  call winrestview(save_view)
endfunction

function! s:get_bottom_lnum(lnum) abort "{{{1
  " close side like '}'
  let foldend = foldclosedend(a:lnum)
  let lnum = foldend == -1 ? a:lnum : foldend
  return lnum
endfunction

function! s:get_top_lnum(lnum) abort "{{{1
  " open side like '{'
  let foldstart = foldclosed(a:lnum)
  let lnum = foldstart == -1 ? a:lnum : foldstart
  return lnum
endfunction

function! s:specify_the_outermost_pair_in_the_line(lnum) abort "{{{1
  let line = getline(a:lnum)
  " matchend() never returns 0.
  let biggest_match_col = 0
  let the_pair = []
  silent! unlet s:the_pair
  let pairs = s:set_pairs()

  for p in pairs
    let match_col = 0
    while match_col != -1
      try
        let match_col = matchend(line, p[len(p) - 1], match_col)
      catch /^Vim:E65:/
        " Note: E65 sometimes happens when a pair contains atoms like '\1'.
        " FIXME: This ':try' seems useless. Even when catch without any
        " arguments, it freezes Vim.
        continue
      endtry
      if match_col > biggest_match_col
        let biggest_match_col = match_col
        let the_pair = p
      endif
    endwhile
  endfor

  let s:the_pair = the_pair
  return the_pair
endfunction

function! s:set_pairs() abort "{{{1
  if exists('b:doppelganger_pairs')
    return b:doppelganger_pairs
  endif

  if exists('b:match_words')
    let b:doppelganger_pairs = s:parse_matchwords()
  endif

  return g:doppelganger#pairs
endfunction

function! s:parse_matchwords() abort "{{{1
  let pair_list = split(b:match_words, ',')
  let pairs = map(deepcopy(pair_list), 'split(v:val, ":")')
  return pairs
endfunction

function! s:get_lnum_open(pair_dict, stop_lnum) abort "{{{1
  let pat_open = a:pair_dict[0]
  let pat_close = a:pair_dict[len(a:pair_dict) - 1]
  let flags_mobile_upward_inc = 'cbW'
  let flags_unmove_upward_exc = 'nbWz'
  let Skip_comments = 'synIDattr(synID(line("."), col("."), 0), "name") =~? "comment"'

  norm! $
  let lnum_close = search(pat_close, flags_mobile_upward_inc)
  " searchpair() fails to parse line-continuation with 'c'-flag
  let lnum_open = searchpair(pat_open, '', pat_close,
        \ flags_unmove_upward_exc, Skip_comments)

  if lnum_open == lnum_close
    " Continue the while loop anyway.
    return 0
  endif

  return lnum_open
endfunction

function! s:set_curpos(stop_lnum) abort "{{{1
  let lnum = s:cur_lnum
  if !s:is_inside_fold(lnum)
    exe lnum
    return lnum
  endif

  let save_next = lnum
  while s:is_inside_fold(lnum) || lnum > a:stop_lnum
    if lnum > 0
      let save_next = lnum
      let lnum -= 1
    endif
    let lnum = foldclosed(lnum)
  endwhile

  exe save_next
  return save_next
endfunction

function! s:is_inside_fold(lnum) abort "{{{1
  return foldclosed(a:lnum) != -1
endfunction

function! s:set_text_on_lnum(lnum_open) abort "{{{1
  let text = getline(a:lnum_open)
  let text = s:modify_text(text, a:lnum_open)
  let chunks = [[text, 'DoppelGanger']]
  let print_lnum = s:cur_lnum - 1
  call nvim_buf_set_virtual_text(
        \ 0,
        \ s:namespace,
        \ print_lnum,
        \ chunks,
        \ {}
        \ )
endfunction

function! s:modify_text(text, lnum) abort "{{{1
  let lnum = a:lnum
  let text = a:text
  while 1
    let text = getline(lnum)
    let text = s:truncate_pat_open(text)
    let text = substitute(text, '^\s*', '', 'e')
    if text !~# '^\s*$' | break | endif
    let lnum -= 1
  endwhile
  let text = g:doppelganger#prefix . text
  return text
endfunction

function! s:truncate_pat_open(text) abort "{{{1
  let pat_open = s:the_pair[0]
  return substitute(a:text, pat_open .'\(.*'. pat_open .'\)\@!\S*', '', 'e')
endfunction

" restore 'cpoptions' {{{1
let &cpo = s:save_cpo
unlet s:save_cpo

" modeline {{{1
" vim: et ts=2 sts=2 sw=2 fdm=marker tw=79
