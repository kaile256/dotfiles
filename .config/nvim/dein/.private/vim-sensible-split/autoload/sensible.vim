" ============================================================================
" Repo: kaile256/vim-sensible-split
" File: autoload/sensible.vim
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

let g:sensible_split#vertical_condition =
      \ get(g:, 'sensible_split#vertical_condition',
      \     'winwidth(0) >= 2 * (&tw ? &tw : 80)')
let g:sensible_split#horizontal_condition =
      \ get(g:, 'sensible_split#horizontal_condition',
      \     'winwidth(0) >= (&tw ? &tw : 80) && winheight(0) > (&equalalways ? 20 : 30)')

function! s:wants_vertical()
  return eval(g:sensible_split#vertical_condition)
endfunction

function! s:wants_horizontal()
  return eval(g:sensible_split#horizontal_condition)
endfunction

function! sensible#split(...)
  let split = 'tabe'
  let bang = a:0 > 0 ? a:1 : 0
  if bang
    let split = 'split | wincmd T | vsplit'
  endif

  if s:wants_vertical()
    let split = 'vsplit'
  elseif s:wants_horizontal()
    let split = 'split'
  endif

  return split
endfunction

function! sensible#mods(bang, ...)
  if a:0 > 0 && join(a:000) =~# 'help\|man'
    for bufnr in tabpagebuflist()
      if getbufvar(bufnr, '&filetype', 'help\|man')
        return ''
      endif
    endfor
  endif

  let mods = 'tab'
  let bang = a:0 > 0 ? a:1 : 0
  if bang
    let mods = 'split | wincmd T | vertical'
  endif

  if s:wants_vertical()
    let mods = 'vertical'
  elseif s:wants_horizontal()
    let mods = 'below'
  endif

  if a:0 > 0 && a:1 ==# ''
    return mods
  endif

  return mods .' '. join(a:000)
endfunction

function! sensible#cword(cmd, ...)
  let col = col('.') + 1
  let str = '\(\k\|-\)*'
  let args = matchstr(getline('.'), str .'\%'. col .'c'. str)
  let args = substitute(args, '\w[,.]$', '', '')

  let bang = a:0 > 0 && a:1 ? '!' : ''

  try
    return 'SensibleMods'. bang .' '. a:cmd .' '. args
  catch /E149/
    return 'SensibleMods'. bang .' '. a:cmd .' '. expand('<cword>')
  endtry
endfunction

" restore 'cpoptions' {{{1
let &cpo = s:save_cpo
unlet s:save_cpo

" modeline {{{1
" vim: et ts=2 sts=2 sw=2 fdm=marker tw=79
