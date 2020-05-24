" ============================================================================
" Repo: kaile256/vim-private-note
" File: autoload/private_note.vim
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

let g:private_note#root_path = get(g:, 'private_note#root_path',
      \ $XDG_DATA_HOME .'/private_note'
      \ )

let g:private_note#default_filename = get(g:, 'private_note#default_filename',
      \ 'expand("%:t:r")'
      \ )

let g:private_note#default_extension = get(g:, 'private_note#default_extension',
      \ '.md'
      \ )

function! private_note#new(mods, path) abort
  let open = empty(a:mods) ? 'e' : a:mods .' sp'
  let path = empty(a:path) ? s:set_default_path() : a:path

  call s:mkdir_on_demand(path)

  exe open path
endfunction

function! s:set_default_path() abort "{{{1
  let paths = {
       \ 'dir': g:private_note#root_path,
       \ 'fname': g:private_note#default_filename,
       \ 'ext': g:private_note#default_extension,
       \ }

  for tmp in keys(paths)
    let {tmp} = paths[tmp]
    let {tmp} = s:try_eval({tmp})
    let {tmp} = s:tidy_path({tmp})
  endfor
  let path = '/'. dir .'/'. fname . ext

  let g:foo = path
  return path
endfunction

function! s:try_eval(args) abort "{{{1
  try
    return eval(a:args)
  catch
    return a:args
  endtry
endfunction

function! s:tidy_path(path) abort "{{{1
  " Tidy path without '//'

  let ret = a:path
  let ret = substitute(ret, '^\/', '', '')
  let ret = substitute(ret, '\/$', '', '')
  return ret
endfunction

function! s:mkdir_on_demand(path) abort "{{{1
  " Create directories with confirmation if parent directories don't exist.

  let dir = fnamemodify(a:path, ':h')
  if isdirectory(dir) | return | endif

  let existed = dir
  while !isdirectory(existed)
    let existed = fnamemodify(existed, ':h')
  endwhile
  let existed .= '/'

  let lack = substitute(dir, '^'. existed, '', '')
  let lack .= '/'

  let confirmed = input(' Private Note: '
        \ .'create dir '
        \ .'"'. lack .'" under "'. existed .'"'
        \ .'? ([y]es/[n]o) : ')

  if confirmed =~? 'y\%[es]'
    call mkdir(dir, 'p')
  endif
endfunction

