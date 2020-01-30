" From: git.toml
" Repo: samoshkin/vim-mergetool
" Another: add/mergetool.vim

" Available:
"   m: merged
"   r: remote
"   b: base
"   ,: split in below after it
" Default: 'mr'
"let g:mergetool_layout = 'mr'

function! AirlineMergetool() abort
  if get(g:, 'mergetool_in_merge_mode', 0)
    return '↸'
  endif

  if &diff
    return '↹'
  endif

  return ''
endfunction

call airline#parts#define_function('_diffmerge', 'AirlineMergetool')
call airline#parts#define_accent('_diffmerge', 'bold')
