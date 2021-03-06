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

function! s:wants_vertical(cond)
  let cond = get(a:cond, 'vertical', g:sensible_split#vertical_condition)
  return eval(cond)
endfunction

function! s:wants_horizontal(cond)
  let cond = get(a:cond, 'horizontal', g:sensible_split#horizontal_condition)
  return eval(cond)
endfunction

function! sensible#style(...)
  let cond = a:0 > 0 ? a:1 : {}
  if s:wants_vertical(cond)
    return 'vertical'
  elseif s:wants_horizontal(cond)
    return 'horizontal'
  endif

  return 'tab'
endfunction

function! sensible#_split(bang)
  " For a command with bang

  let split = sensible#split()
  if split =~? 'tabnew\|tabe\%[dit]'
    return a:bang ? 'split | wincmd T | vsplit' : 'tabe %'
  endif

  return split
endfunction

function! sensible#_new(bang)
  let new = sensible#new()
  if new =~? 'tabnew\|tabe\%[dit]'
    return a:bang ? 'split | wincmd T | vnew' : 'tabnew'
  endif

  return new
endfunction

function! sensible#split(...)
  let cond = a:0 > 0 ? a:1 : {}
  let style = sensible#style(cond)
  if style ==? 'vertical'
    return 'vsplit'
  elseif style ==? 'horizontal'
    return 'split'
  endif

  return 'tabe'
endfunction

function! sensible#new(...)
  let cond = a:0 > 0 ? a:1 : {}
  let style = sensible#style(cond)
  if style ==? 'vertical'
    return 'vnew'
  elseif style ==? 'horizontal'
    return 'new'
  endif

  return 'tabnew'
endfunction

function! sensible#_mods(bang, cmd)
  if a:cmd =~# '\s*\(help\|man\)'
    let bufnr = bufwinnr('\.txt$')
    if getbufvar(bufnr, '&filetype', 'help\|man')
      return a:cmd
    endif
  endif

  let mods = sensible#mods()
  return mods .' '. a:cmd
endfunction

function! sensible#mods(...)
  let cond = a:0 > 0 ? a:1 : {}
  let style = sensible#style(cond)
  if style ==? 'vertical'
    return 'vertical'
  elseif style ==? 'horizontal'
    return 'below'
  endif

  return 'tab'
endfunction

function! sensible#cword(bang, cmd)
  let col = col('.') + 1
  let str = '\(\k\|-\)*'
  let args = matchstr(getline('.'), str .'\%'. col .'c'. str)
  let args = substitute(args, '\w[,.]$', '', '')

  try
    return 'SensibleMods'. a:bang .' '. a:cmd .' '. args
  catch /E149/
    return 'SensibleMods'. a:bang .' '. a:cmd .' '. expand('<cword>')
  endtry
endfunction

" restore 'cpoptions' {{{1
let &cpo = s:save_cpo
unlet s:save_cpo

" modeline {{{1
" vim: et ts=2 sts=2 sw=2 fdm=marker tw=79
