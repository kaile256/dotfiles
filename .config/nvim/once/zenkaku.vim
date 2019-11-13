scriptencoding utf-8
" From: init.vim

hi Zenkaku cterm=reverse,bold,undercurl gui=reverse,bold,undercurl

let g:zenkakuNumber = matchadd('Zenkaku', '[　０１２３４５６７８９]')
let g:zenkakuLower  = matchadd('Zenkaku', '[ａｂｃｄｅｆｇｈｉｊｋｌｍｎｏｐｑｒｓｔｕｖｗｘｙｚ]')
let g:zenkakuUpper  = matchadd('Zenkaku', '[ＡＢＣＤＥＦＧＨＩＪＫＬＭＮＯＰＱＲＳＴＵＶＷＸＹＺ]')
