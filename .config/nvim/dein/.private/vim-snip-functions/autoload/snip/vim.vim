" ============================================================================
" Repo: kaile256/vim-snip-functions
" File: snip/vim.vim
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

let s:dir_list = [
      \ 'autoload',
      \ 'doc',
      \ 'ftdetect',
      \ 'ftplugin',
      \ 'plugin',
      \ 'syntax',
      \ 'indent',
      \ 'colors',
      \ ]

let s:dir = '\(/'. join(s:dir_list, '/\|/') .'/\)'
unlet s:dir_list

" write examples in each autoload-functions as below:
"   1. the repository is 'user/vim-plugin-name'
"   2. cwd is 'current-file.vim'

" Helper Functions "{{{1
function! s:underscored(path) abort
  return substitute(a:path, '-', '_', 'g')
endfunction

function! snip#vim#name_of_repo() abort "{{{1
  if &ft ==# 'toml'
    let lnum = search('^repo = ', 'nbW')
    let line = getline(lnum)
    let repo = matchstr(line, 'repo = ''\zs.\{-}\ze''')

    return repo
  endif

  " return 'vim-plugin-name'
  return matchstr(expand('%:p'),
        \ '\%['. s:dir .']'
        \ .'\zs\%[vim-].\{-}\%[.n]\%[vim]\ze'.
        \ s:dir)
endfunction

function! snip#vim#name_of_plugin_row() abort "{{{1
  " return 'vim-plugin-name', 'plugin-name.nvim' or so kind.
  return substitute(snip#vim#name_of_repo(), '.\{-}/', '', 'e')
endfunction


function! snip#vim#name_of_plugin() abort "{{{1
  " return 'plugin-name'
  let ret = substitute(snip#vim#name_of_plugin_row(), '[.-]n\?vim$', '', 'e')

  " keep 'vim' if the plugin name is 'vimfoo' not 'vim-foo'.
  let ret = substitute(ret, '^n\?vim-', '', 'e')
  return ret
endfunction

function! snip#vim#path_root_to_file() abort "{{{1
  " return 'path/to/current-file' after 'vim-plugin-name/'
  return substitute(snip#vim#name_of_repo(), '/.\{-}', '', 'e')
endfunction

function! snip#vim#name_of_plugin_underscored() abort "{{{1
  " return 'plugin_name'
  return s:underscored(snip#vim#name_of_plugin())
endfunction

function! snip#vim#prefix_for_function() abort "{{{1
  " return 's:' or 'root#to#current_file#'
  let fname = matchstr(expand('%:p'), '/autoload/\zs.*\ze\.vim$')
  if empty(fname) | return 's:' | endif

  let underscored = s:underscored(fname)
  let prefix_for_autoload = substitute(underscored, '[/\\]', '#', 'ge') .'#'
  return prefix_for_autoload
endfunction

" restore 'cpoptions' {{{1
let &cpo = s:save_cpo
unlet s:save_cpo

" modeline {{{1
" vim: et ts=2 sts=2 sw=2 fdm=marker tw=79
