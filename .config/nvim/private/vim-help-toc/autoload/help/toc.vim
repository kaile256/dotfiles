" ============================================================================
" File: autoload/help/toc.vim
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

" Ref: $VIMRUNTIME/ftplugin/help.vim @25
function! help#toc#open(mods) abort "{{{1
  " TODO: toggle! like :TagbarToggle
  let bufname = bufname('%')
  let info = getloclist(0, {'winid': 1})

  if !empty(info) && getwinvar(info.winid, 'qf_toc') ==# bufname
    lopen
    return
  endif

  let toc = []
  let lnum = 2
  let last_line = line('$') - 1
  let last_index = 0
  let has_section = 0
  let has_sub_section = 0
  let toc_width = 0

  while lnum && lnum <= last_line "{{{2
    let level = 0
    let index = ''
    let text = getline(lnum)

    if text =~# '^=\+$' && lnum + 1 < last_line
      " A de-facto section heading.  Other headings are inferred.
      let has_section = 1
      let has_sub_section = 0
      let lnum = nextnonblank(lnum + 1)
      let text = getline(lnum)
      let index = text

      while index =~# '\*[^*]\+\*\s*$'
        let index = matchstr(index, '.*\ze\*[^*]\+\*\s*$')
      endwhile

    elseif text =~# '^[A-Z0-9][-A-ZA-Z0-9 .][-A-Z0-9 .():]*\%([ \t]\+\*.\+\*\)\?$'
      " Any line that's yelling is important.
      let has_sub_section = 1
      let level = has_section
      let index = matchstr(text, '.\{-}\ze\s*\%([ \t]\+\*.\+\*\)\?$')

    elseif text =~# '\~$'
          \ && matchstr(text, '^\s*\zs.\{-}\ze\s*\~$') !~# '\t\|\s\{2,}'
          \ && getline(lnum - 1) =~# '^\s*<\?$\|^\s*\*.*\*$'
          \ && getline(lnum + 1) =~# '^\s*>\?$\|^\s*\*.*\*$'
      " These lines could be headers or code examples.  We only want the
      " ones that have subsequent lines at the same indent or more.
      let l = nextnonblank(lnum + 1)

      if getline(l) =~# '\*[^*]\+\*$'
        " Ignore tag lines
        let l = nextnonblank(l + 1)
      endif

      if indent(lnum) <= indent(l)
        let level = has_section + has_sub_section
        let index = matchstr(text, '\S.*')
      endif
    endif

    let index = substitute(index, '\s\+$', '', 'g')

    let is_index = !empty(index) && last_index != lnum
    if is_index
      let last_index = lnum
      " Note: [bufnr, lnum] is necessary to jump when <CR>
      call add(toc, {
            \ 'text': repeat('  ', level) .
            \   toupper(matchstr(index, '\a')) . tolower(index[matchstrpos(index, '\a')[1] + 1:]),
            \ 'bufnr': bufnr('%'),
            \ 'lnum': lnum,
            \ })

      let g:help#toc#maxwidth = get(g:, 'help#toc#maxwidth', '')
      if get(g:, 'help#toc#autowidth', 1) && strlen(index) > toc_width
        if toc_width < g:help#toc#maxwidth
          let toc_width = strlen(index) + 2
        else
          let toc_width = g:help#toc#maxwidth
        endif
      endif
    endif

    let lnum = nextnonblank(lnum + 1)
  endwhile "}}}

  call setloclist(0, toc, ' ')
  call setloclist(0, [], 'a', {
        \ 'title': get(g:, 'help#toc#title', 'Help TOC')
        \ })

  exe a:mods toc_width 'lopen'
  " Note: sometimes fails to open correctly,
  "       i.e., open TOC with unnecessary path and numbers,
  "       but when ':lopen' twice, works correct
  wincmd p
  exe a:mods toc_width 'lopen'

  for opt in get(g:, 'help#toc#setlocal', [
        \ 'winfixwidth',
        \ 'nonumber',
        \ 'nowrap',
        \ 'foldmethod=indent',
        \ 'fdl=0'
        \ ])

    exe 'setlocal' opt
  endfor

  let w:qf_toc = bufname

  if !get(g:, 'help#toc#no_default_mappings_toc', 0)
    call s:toc_keymaps()
  endif
endfunction

function! s:toc_keymaps() abort
  nnoremap <silent><buffer><nowait> <cr> <cr>:lclose<cr>
  nnoremap <silent><buffer><nowait> p    <cr><c-w>p
endfunction

" restore 'cpoptions' {{{1
let &cpo = s:save_cpo

" modeline {{{1
" vim: expandtab tabstop=2 softtabstop=2 shiftwidth=2
"      foldmethod=marker
