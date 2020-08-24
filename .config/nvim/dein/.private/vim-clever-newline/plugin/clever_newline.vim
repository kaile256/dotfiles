" ============================================================================
" Repo: kaile256/.config/nvim
" File: plugin/clever_newline.vim
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

" save 'cpoptions' "{{{
let s:save_cpo = &cpo
set cpo&vim
"}}}

let g:clever_newline#trailing_spaces =
      \ get(g:, 'clever_newline#trailing_spaces', ' ')
let g:clever_newline#no_default_mappings =
      \ get(g:, 'clever_newline#no_default_mappings', 0)

inoremap <expr><silent> <Plug>(clever-newline)
      \ <SID>is_in_commentblock(+1)
      \ ? '<NL>'. <SID>start_comment()
      \ : '<NL>'

nnoremap <expr><silent> <Plug>(clever-newline-o)
      \ <SID>is_in_commentblock(+1)
      \ ? 'o'. <SID>start_comment()
      \ : 'o'
nnoremap <expr><silent> <Plug>(clever-newline-O)
      \ <SID>is_in_commentblock(-1)
      \ ? 'O'. <SID>start_comment()
      \ : 'O'

if !g:clever_newline#no_default_mappings
  silent! imap <unique> <c-j> <Plug>(clever-newline)
  silent! imap <unique> <CR>  <Plug>(clever-newline)

  silent! nmap <unique> o <Plug>(clever-newline-o)
  silent! nmap <unique> O <Plug>(clever-newline-O)
endif

function! s:is_in_commentblock(diff) abort "{{{1
  if &commentstring !~# '%s' | return 0 | endif

  if &fo =~# 'r\|o'
    silent! set fo-=r fo-=o
  endif

  let cms = substitute(split(&commentstring, '%s')[0], '\*', '\\*', 'g')
  let cms_head = '^\s*'. cms

  let line = line('.')
  let l_around = line + a:diff

  if getline(line) =~# cms_head && getline(l_around) =~# cms_head
    return 1
  endif

  return 0
endfunction

function! s:start_comment() abort "{{{1
  let trail = get(b:, 'clever_newline_trailing_spaces',
        \   g:clever_newline#trailing_spaces)

  if &commentstring !~# '%s'
    return ''
  endif

  return split(&commentstring, '%s')[0] . trail
endfunction

" restore 'cpoptions' {{{1
let &cpo = s:save_cpo
unlet s:save_cpo

" modeline {{{1
" vim: et ts=2 sts=2 sw=2 fdm=marker tw=79
