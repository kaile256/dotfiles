" ============================================================================
" File: plugin/yamlfold.vim
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
"}}}1

if v:version < 700 | finish | endif

if get(g:, 'loaded_yamlfold', 0) | finish | endif
let g:loaded_yamlfold = 1

let g:yamlfold#disable_indent  = get(g:, 'yamlfold#disable_indent',  0)
let g:yamlfold#disable_headers = get(g:, 'yamlfold#disable_headers', 0)
let g:yamlfold#disable_imports = get(g:, 'yamlfold#disable_imports', 0)
let g:yamlfold#disable_pairs   = get(g:, 'yamlfold#disable_pairs',   0)

let g:yamlfold#debug#enable = get(g:, 'yamlfold#debug#enable', 0)
let g:yamlfold#debug#write_path  = get(g:, 'yamlfold#debug#write_path',
      \ "'/tmp/vim-yamlfold-'. expand('%:t:r') .'.log'"
      \ )
let g:yamlfold#debug#log_location = get(g:, 'yamlfold#debug#log_location',
      \ 'vertical botright')

let g:yamlfold#active_filetypes = get(g:, 'yamlfold#active_filetypes', [
      \ 'yaml']
      \ )
let g:yamlfold#from_firstline = get(g:, 'yamlfold#fold_firstline', 0)

" Note: without '^', those in comments can be match.
let g:yamlfold#imports = get(g:, 'yamlfold#imports', {
      \ 'python': ['^import', '^from'],
      \ })
let g:yamlfold#pairs   = get(g:, 'yamlfold#pairs', {
      \ 'python':   ['"""\(.*"""\)\@!', '^\s*"""$'],
      \ 'sh':   [
      \   ['^\s*for ', '^\s*done'],
      \   ['^\s*case ', '^\s*esac'],
      \   ['^\s*if ', '^\s*fi'],
      \   ['=($', '^)$']
      \ ],
      \ })

let g:yamlfold#include_blanklines = get(g:, 'yamlfold#include_blanklines', 0)
let g:yamlfold#_blankline = g:yamlfold#include_blanklines
      \ ? '^\s*$'
      \ : 'skip\&it'

let s:filetypes = join(g:yamlfold#active_filetypes, ',')

augroup YamlFoldActivate
  exe 'au! FileType' s:filetypes 'call yamlfold#activate()'
augroup END

if g:yamlfold#debug#enable
  command! -bar -nargs=* YamlfoldLogWrite
        \ :call yamlfold#debug#log_write(<q-args>)
  command! -bar YamlfoldLogOpen
        \ :call yamlfold#debug#log_open(<q-mods>)
  command! -bar -nargs=* YamlfoldLogWriteAndOpen
        \ :YamlfoldLogWrite <args>
        \ | <mods> YamlfoldLogOpen
endif

" restore 'cpoptions' {{{1
let &cpo = s:save_cpo
unlet s:save_cpo

" modeline {{{1
" vim: expandtab tabstop=2 softtabstop=2 shiftwidth=2
" vim: foldmethod=marker textwidth=79
