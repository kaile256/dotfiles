" TOML: git.toml
" Repo: cohama/agit.vim

hi! link agitDiffRemoveMerge agitDiffRemove
hi! link agitDiffAddMerge agitDiffAdd

syn region agitCommitUnaffectable start='\v(style|docs|chore|test)\S*: ' end="\ze|>" containedin=agitLog

hi! link agitCommitUnaffectable Comment
