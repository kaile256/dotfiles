" ============================================================================
" Repo: kaile256/vim-snip-functions
" File: plugin/snip.vim
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

let g:snip#priority = get(g:, 'snip#priority', 99)

if exists('g:neosnippet#snippets_directory')
  let s:snippets_dir = 'snippets/neosnippet'
  let s:path_to_snippets = expand('<sfile>:p:h:h') .'/'. s:snippets_dir

  if g:snip#priority != -1
    try
      call insert(g:neosnippet#snippets_directory, s:path_to_snippets,
            \ g:snip#priority)
    catch
      call add(g:neosnippet#snippets_directory, s:path_to_snippets)
    endtry
  endif

  unlet s:snippets_dir s:path_to_snippets
endif
