scriptencoding utf-8
" From: init.vim

" Note: no use in s:var.
"   Use w:var; g:var sometimes fails
if exists('w:syntax_zenkaku') | finish | endif

hi! Zenkaku cterm=reverse,bold,undercurl gui=reverse,bold,undercurl

" Note: no use as s:var
let w:syntax_zenkaku = matchadd('Zenkaku', '[ＡＢＣＤＥＦＧＨＩＪＫＬＭＮＯＰＱＲＳＴＵＶＷＸＹＺ]')
let w:syntax_zenkaku = matchadd('Zenkaku', '[ａｂｃｄｅｆｇｈｉｊｋｌｍｎｏｐｑｒｓｔｕｖｗｘｙｚ]')
let w:syntax_zenkaku = matchadd('Zenkaku', '[　０１２３４５６７８９]')

" syn match operatorNot '\S\@<!!'
hi! operatorNot ctermfg=15 guifg=#ffffff cterm=bold gui=bold
let w:syntax_operator_not = matchadd('OperatorNot', '\S\@<!!\ze\s*\a')

let w:syntax_annotation = matchadd('TODO', '\v(TODO|FIXME|XXX|WARNING|NOTE|Note|Tips)\ze: ')
