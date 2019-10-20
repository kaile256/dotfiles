" ============================================================================
" File: autoload/halfline.vim
" Author: kaile256
" License: MIT License
" ============================================================================

if v:version < 704 | finish | endif
if exists('g:loaded_halfline') | finish | endif
let g:loaded_halfline = 1

" save cpoptions {{{
let s:save_cpo = &cpo
set cpo&vim
"}}}

" TODO: any percentage of dest-lines should be available,
"       like top/middle/bottom as 0/50/100,
function! halfline#jk(jk) abort range
  " TODO: make l:before immutable; deepcopy() is no nse for str.
  let l:before = winline()
  lockvar l:before

  if a:jk ==# 'j'
    norm! L
    let go_back = 'k'
    let l:dest = round((winline() + l:before) /2.0)
    let yet = winline() > l:dest
  elseif a:jk ==# 'k'
    norm! H
    let go_back = 'j'
    let l:dest = round((winline() + l:before) /2.0)
    let yet = winline() < l:dest
  endif

  while yet == 1
    exe 'norm! g'. go_back
    if winline() ==# l:before
      echom 'identical'
      return
    endif
    if winline() == 1
      return
    endif
  endwhile
endfunction

" restore cpoptions {{{
let &cpo = s:save_cpo
unlet s:save_cpo
"}}}
" vim: ts=2 sts=2 sw=2 et fdm=marker

