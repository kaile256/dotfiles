scriptencoding utf-8
" From: init.vim

" Note: no use in s:var.
"   Use w:var; g:var sometimes fails
if exists('w:zenkaku') | finish | endif

hi! Zenkaku cterm=reverse,bold,undercurl gui=reverse,bold,undercurl

" Note: no use as s:var
let w:zenkaku = matchadd('Zenkaku', '[ＡＢＣＤＥＦＧＨＩＪＫＬＭＮＯＰＱＲＳＴＵＶＷＸＹＺ]')
let w:zenkaku = matchadd('Zenkaku', '[ａｂｃｄｅｆｇｈｉｊｋｌｍｎｏｐｑｒｓｔｕｖｗｘｙｚ]')
let w:zenkaku = matchadd('Zenkaku', '[　０１２３４５６７８９]')
