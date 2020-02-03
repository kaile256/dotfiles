if exists('s:loaded') | finish | endif
let s:loaded = 1

" save 'cpoptions' {{{
let s:save_cpo = &cpo
set cpo&vim
"}}}1

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

let s:dir = '\('. join(s:dir_list, '/\|') .'\)'

function! neosnippet#name#plugin() abort
  return matchstr(expand('%:p'), '/\%[vim-]\zs[^/]\+\ze\%[.n]\%[vim]/'. s:dir)
endfunction

function! neosnippet#name#file() abort
  return expand('%:p') =~# s:dir
        \ ? matchstr(expand('%:p:.'), s:dir .'.*')
        \ : matchstr(expand('%:r'), '[^.]*\ze\.')
endfunction

function! neosnippet#name#repo() abort
  return matchstr(expand('%:p'), '[^/]\+\ze/'. s:dir)
endfunction

" restore 'cpoptions' {{{1
let &cpo = s:save_cpo
unlet s:save_cpo

" modeline {{{1
" vim: et ts=2 sts=2 sw=2 fdm=marker tw=79
