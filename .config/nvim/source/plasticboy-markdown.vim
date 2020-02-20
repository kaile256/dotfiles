" From: syntax.toml
" Repo: plasticboy/vim-markdown
" Ref: source/gabrielelana-markdown.vim

" folding works weird on InsertLeave
let g:vim_markdown_folding_disabled  = 1
let g:vim_markdown_override_foldtext = 0

let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_frontmatter = 1

hi! link mkdHeading PreProc
hi! link htmlLink Statement

hi! link htmlH1 String
hi! link htmlH2 htmlH1
hi! link htmlH3 htmlH1

"hi! link mkdBold NonText
hi! link mkdURL NonText
hi! link mkdCodeDelimiter NonText
hi! link mkdCodeStart NonText
hi! link mkdCodeEnd NonText
