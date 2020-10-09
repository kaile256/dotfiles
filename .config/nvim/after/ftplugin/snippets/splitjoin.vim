" From: default.toml
" Repo: AndrewRadev/splitjoin.vim
" Another: add/splitjoin.vim

if !dein#tap('splitjoin.vim') | finish | endif

let b:splitjoin_join_callbacks = [
      \ 'SnippetsJoin_Interpolation'
      \ ]
let b:splitjoin_split_callbacks = [
      \ 'SnippetsSplit_Interpolation'
      \ ]

let s:pat_interpolation_begin = '\v\\@<!`%(![pv]|#!\/\f+)'
let s:pat_interpolation_end = '\v\\@<!`%(![pv]|#!\/\f+)@!'

function! SnippetsSplit_Interpolation() abort
  " TODO
endfunction

function! SnippetsJoin_Interpolation() abort
  const [interpolation_begin_lnum, interpolation_begin_col] = searchpairpos(
        \ s:pat_interpolation_begin,
        \ '',
        \ s:pat_interpolation_end,
        \ 'bcWn')

  if interpolation_begin_lnum <= 0
    return 0
  endif

  const interpolation_end_lnum = searchpair(
        \ s:pat_interpolation_begin,
        \ '',
        \ s:pat_interpolation_end,
        \ 'Wn')

  exe interpolation_begin_lnum ',' interpolation_end_lnum 'join'
  exe 'keeppatterns keepjumps s/\s*\ze'. s:pat_interpolation_end .'//e'

  return 1
endfunction
