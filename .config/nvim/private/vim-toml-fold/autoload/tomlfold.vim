" ============================================================================
" Repo: kaile256/vim-toml-fold
" File: autoload/tomlfold.vim
" Author: Matthias Vogelgesang <github.com/matze>, kaile256
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

let g:tomlfold#styles_on_filetype = get(g:, 'tomlfold#styles_on_filetype', {})
let g:tomlfold#ignore_commentline = get(g:, 'tomlfold#ignore_commentline', {})
let g:tomlfold#header_patterns    = get(g:, 'tomlfold#header_patterns',
      \ ['^\s*[#;]*\s*\[[^,]*]'])

let s:filetypes = [
      \   'cfg',
      \   'config',
      \   'desktop',
      \   'dosini',
      \   'gitconfig',
      \   'toml',
      \ ]
for ft in s:filetypes
  call extend(g:tomlfold#styles_on_filetype, {ft : 1}, 'keep')
  call extend(g:tomlfold#ignore_commentline, {ft : 0}, 'keep')
endfor
unlet s:filetypes

function! tomlfold#activate() "{{{1
  let style_on = index(keys(g:tomlfold#styles_on_filetype), &ft) >= 0

  if get(b:, 'tomlfold_style', style_on)
    setlocal foldmethod=expr
    setlocal foldexpr=tomlfold#expr()
  endif
endfunction

function! tomlfold#expr() "{{{1
  let line    = getline(v:lnum)
  let above   = getline(v:lnum - 1)
  let patterns = get(b:, 'tomlfold_header_patterns',
        \ g:tomlfold#header_patterns)

  let foldstyle = get(b:, 'tomlfold_style',
        \ g:tomlfold#styles_on_filetype[&ft])

  for pat in patterns
    let foldlevel_header = 1

    if line =~# pat
      if foldstyle <= 2
        return '>'. foldlevel_header
      elseif foldstyle == 3
        return '0'
      endif
    endif

    if above =~# pat
      if foldstyle == 2
        return '>'. foldlevel_header + 1
      elseif foldstyle == 3
        return '>'. foldlevel_header
      endif
    endif
  endfor

  return '='
endfunction

" restore 'cpoptions' {{{1
let &cpo = s:save_cpo
unlet s:save_cpo

" modeline {{{1
" vim: et ts=2 sts=2 sw=2 fdm=marker tw=79
