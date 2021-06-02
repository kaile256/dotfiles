" RUNTIME: $VIMRUNTIME/syntax/gitrebase.vim

syn match gitrebaseType '\zs\S\+:' contained contains=gitrebaseTypeKeyword containedin=gitrebaseSummary

syn keyword gitrebaseTypeKeyword contained build ci docs feat fix perf refactor style test containedin=gitrebaseType
syn match gitrebaseTypeIndicator ':' contained containedin=gitrebaseType
syn region gitrebaseScope contained matchgroup=gitrebaseScopeIndicator start='(' end=')' containedin=gitrebaseType oneline

syn region gitrebaseCommitUnaffectable start='\v(style|docs|chore|test)\S*: ' end='\n' containedin=gitrebaseSummary


" Highlight
hi! link gitrebaseType gitrebaseSummary

hi! link gitrebaseTypeKeyword Function
hi! link gitrebaseScope gitrebaseSubject
hi! link gitrebaseTypeIndicator Normal
hi! link gitrebaseScopeIndicator Normal

hi! link gitrebaseCommitUnaffectable Comment
hi! gitrebaseCommentWIP cterm=undercurl gui=undercurl
