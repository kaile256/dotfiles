" ============================================================================
" Repo: kaile256/vim-fzf-git
" File: autoload/fzf/git/stash.vim
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

let g:fzf#git#stash#actions = get(g:, 'fzf#git#stash#actions', {
      \ 'alt-p':  'git stash pop',
      \ 'alt-x':  'git stash drop',
      \ 'return': 'git stash apply',
      \ })

let g:fzf#git#stash#options = get(g:, 'fzf#git#stash#options', [
      \ '--ansi',
      \ '--multi',
      \ '--reverse',
      \ '--inline-info',
      \ '--tiebreak=index',
      \ '--prompt', 'GitStashes> ',
      \ '--preview', 'grep -o "stash@{[0-9]\+}" <<< {} | xargs git stash show --format=format: -p --color=always'
      \ ])

function! fzf#git#stash#list() "{{{1
  let root = s:get_git_root()
  if empty(root)
    return s:warn('Not in git repo')
  endif

  let options = s:stash_options()
  return fzf#run(fzf#wrap(options))
endfunction

function! s:get_git_root() "{{{1
  let root = split(system('git rev-parse --show-toplevel'), '\n')[0]
  return v:shell_error ? '' : root
endfunction

function! s:warn(message) "{{{1
  echohl WarningMsg
  echom a:message
  echohl None
  return 0
endfunction

function! s:stash_options() abort "{{{1
  let opt = {
        \ 'source': 'git stash list',
        \ 'sink*':  function('s:stash_sink'),
        \ 'options': g:fzf#git#stash#options,
        \ }

  let expect_keys = join(keys(g:fzf#git#stash#actions), ',')
  call add(opt.options, '--expect='. expect_keys)

  let header = s:get_header()
  call add(opt.options, '--header')
  call add(opt.options, header)

  return opt
endfunction

function! s:get_header() abort "{{{2
  let format = get(g:, 'fzf#git#stash#header_format', 0)
  if !empty(format)
    return format

  elseif get(g:, 'fzf#git#stash#default_header', 1) == 0
    return
  endif

  let header = ':: Press '

  for l:key in sort(keys(g:fzf#git#stash#actions))
    " `s:stash_options` incluedes 'git stash' redundantly
    let cmd = g:fzf#git#stash#actions[l:key]
    let cmd = substitute(cmd, '\s\+git\s\+', '', '')
    let cmd = substitute(cmd, '\s\+stash\s\+', '', '')
    let header .= toupper(l:key) .' to '. cmd .', '
  endfor

  return substitute(header, ', $', ' stash', '')
endfunction


function! s:stash_sink(lines) "{{{2
  " a:lines are selected lines in fzf except a:lines[0] which represents typed key
  let cmd = get(g:fzf#git#stash#actions, a:lines[0])
  if cmd ==# ''
    " return if the key isn't set in --expect
    return

  elseif cmd ==# 'drop'
    " the other git-stash commands makes no sense in mutiple selection
    for line in a:lines[1:]
      let stash = matchstr(line, 'stash@{[0-9]\+}')
      call system(cmd .' '. stash)
      echomsg stash 'was dropped'
    endfor

  else
    let stash = matchstr(a:lines[1], 'stash@{[0-9]\+}')
    call system(cmd .' '. stash)
    checktime
  endif
endfunction

" restore 'cpoptions' {{{1
let &cpo = s:save_cpo
unlet s:save_cpo

" modeline {{{1
" vim: et ts=2 sts=2 sw=2 fdm=marker tw=79
