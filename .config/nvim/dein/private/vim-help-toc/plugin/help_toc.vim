" ============================================================================
" File: plugin/help_toc.vim
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

if get(g:, 'loaded_help#toc', 0) | finish | endif
let g:loaded_help#toc = 1

" save 'cpoptions' {{{
let s:save_cpo = &cpo
set cpo&vim
"}}}

" Note: do not locate under ftplugin/ because of the g:var
let g:help#toc#location = get(g:, 'help#toc#location', 'vert bot')
if g:help#toc#location !=# ''
  function! s:buffer_config()
    command! -buffer -bar HelpTOC
          \ :call help#toc#open(
          \ <mods>0
          \ ? <q-mods>
          \ : g:help#toc#location
          \ )
    nnoremap <silent><buffer><nowait> gO :<c-u>HelpTOC<cr>
  endfunction
endif

let g:help#toc#filetypes = get(g:, 'help#toc#filetypes', 'help')
if g:help#toc#filetypes !=# ''
      \ && exists('*s:buffer_config')
  " makes an augroup HelpTOC which fires on FileType as g:help#toc#filetypes
  augroup HelpTOC
  augroup END
  exe 'au! HelpTOC FileType' g:help#toc#filetypes
        \ 'command! -buffer -bar HelpTOC :call s:buffer_config()'
endif

" restore 'cpoptions' {{{1
let &cpo = s:save_cpo

" modeline {{{1
" vim: expandtab tabstop=2 softtabstop=2 shiftwidth=2
"      foldmethod=marker
