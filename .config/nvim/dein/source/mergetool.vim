" From: git.toml
" Repo: samoshkin/vim-mergetool
" Another: add/mergetool.vim

" Note:
"   vim-mergetool removes conflict markers from MERGED file, and picks up
"   `ours/local` side of a conflict by default.
" Available: local, remote, base, unmodifiled
"   unmodifiled: keep from removing conflict markers
"   local: current branch HEAD.
"   remote: HEAD of the branch we're going to merge
"   base: common ancestor of two branches, i.e. git merge-base branchX branchY
"   Note:
"     in uppercase, those revision are derived from MERGED file by picking up
"     either side of a conflict from conflict markers
" Default: local
"let g:mergetool_prefer_revision = 'remote'

" Available: mrb,
"   m: MERGED file
"   r: remote file
"   b: base file
"   ,: split in below after it
" Default: 'mr'
"let g:mergetool_layout = 'mr'

if !dein#tap('vim-airline') | finish | endif

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
