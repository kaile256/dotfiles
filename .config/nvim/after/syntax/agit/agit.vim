" TOML: git.toml
" Repo: cohama/agit.vim

hi! link agitDiffRemoveMerge agitDiffRemove
hi! link agitDiffAddMerge agitDiffAdd

syn match agitCommitType '\S\+: ' contained containedin=agitLog contains=agitCommitTypeKeyword
syn keyword agitCommitTypeKeyword contained build ci docs feat fix perf refactor style test

syn region agitCommitUnaffectable start='\v(style|docs|chore|test)\S*: ' end="\ze|>" containedin=agitLog
syn region agitCommentWIP start='WIP: ' end='\ze\s*|>' contained containedin=agitLog

syn match agitRefStash 'refs/stash' contained containedin=agitRef

syn region agitCommitMerged start=' \zsMerge ' end="\ze\s*|>" contained containedin=agitLog

hi! link agitCommitTypeKeyword Function
hi! link agitCommitUnaffectable Comment
hi! agitCommentWIP cterm=undercurl gui=undercurl
hi! link agitRefStash Error
hi! agitCommitMerged cterm=underline gui=underline
