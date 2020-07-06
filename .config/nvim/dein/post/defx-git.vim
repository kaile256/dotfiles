" From: browse.toml
" Repo: kristijanhusak/defx-git
" Ref: post/defx.vim

" Show indicator for git-ignored files
call defx#custom#column('git', 'show_ignored', 1)

" Show indicator as `git status --porcelain` like 'M', '??', not by preset
" icons.
" call defx#custom#column('git', 'raw_mode', 1)

call defx#custom#column('git', 'indicators', {
      \ 'Modified'  : '✹',
      \ 'Staged'    : '✚',
      \ 'Untracked' : '✭',
      \ 'Renamed'   : '➜',
      \ 'Unmerged'  : '═',
      \ 'Ignored'   : '☒',
      \ 'Deleted'   : '✖',
      \ 'Unknown'   : '?'
      \ })
