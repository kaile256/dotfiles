" ============================================================================
" Repo: kaile256/vim-fzf-git
" File: autoload/fzf/git/reflog.vim
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

" 'show' is default so set it in 'return'
" 'exists' returns 0 or non-0, i.e., True or false
let g:fzf#git#reflog#actions = get(g:, 'fzf#git#reflog#actions', {
      \ 'alt-e':  'git reflog expire',
      \ 'alt-h':  'git reset --hard',
      \ 'alt-r':  'git branch',
      \ 'alt-s':  'git reset --soft',
      \ 'alt-t':  'git reflog exists',
      \ 'alt-x':  'git reflog delete',
      \ 'return': 'git reset',
      \ })

function! fzf#git#reflog#list() "{{{1
  let root = s:get_git_root()
  if empty(root)
    return s:warn('Not in git repo')
  endif

  let options = s:reflog_options()
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

function! s:reflog_options() abort "{{{1
  let opt = {
        \ 'source': 'git reflog',
        \ 'sink*':  function('s:reflog_sink'),
        \ 'options': [
        \   '--ansi',
        \   '--multi',
        \   '--reverse',
        \   '--inline-info',
        \   '--tiebreak=index',
        \   '--prompt', 'GitReflog> ',
        \   '--preview', 'grep -o "HEAD@{[0-9]\+}" <<< {} | xargs git reflog show --format=format: -p --color=always'
        \ ]
        \ }

  let expect_keys = join(keys(g:fzf#git#reflog#actions), ',')
  call add(opt.options, '--expect='. expect_keys)

  if get(g:, 'fzf#git#reflog#show_default_header', 1)
    let header = ':: Press '

    for l:key in sort(keys(g:fzf#git#reflog#actions))
      " `s:reflog_options` incluedes 'git reflog' redundantly
      let cmd = substitute(g:fzf#git#reflog#actions[l:key],
            \ 'git\s\+\%[reflog]', '', '')
      let header .= toupper(l:key) .' to '. cmd .', '
    endfor

    let header = substitute(header, ', $', ' reflog', '')

    call add(opt.options, '--header')
    call add(opt.options, header)
  endif

  return opt
endfunction

function! s:reflog_sink(lines) "{{{2
  " a:lines are selected lines in fzf except a:lines[0] which represents typed key
  let cmd = get(g:fzf#git#reflog#actions, a:lines[0])
  if cmd ==# ''
    " return if the key isn't set in --expect
    return

  elseif cmd ==# 'drop'
    " the other git-reflog commands makes no sense in mutiple selection
    for line in a:lines[1:]
      let reflog = matchstr(line, 'HEAD@{[0-9]\+}')
      call system(cmd .' '. reflog)
      echomsg reflog 'was dropped'
    endfor

  else
    let reflog = matchstr(a:lines[1], 'HEAD@{[0-9]\+}')
    call system(cmd .' '. reflog)
    checktime
  endif
endfunction

" restore 'cpoptions' {{{1
let &cpo = s:save_cpo
unlet s:save_cpo

" modeline {{{1
" vim: et ts=2 sts=2 sw=2 fdm=marker tw=79
