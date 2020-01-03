scriptencoding utf-8
" From: init.vim

hi! Zenkaku cterm=reverse,bold,undercurl gui=reverse,bold,undercurl

let w:zenkaku = matchadd('Zenkaku', '[ＡＢＣＤＥＦＧＨＩＪＫＬＭＮＯＰＱＲＳＴＵＶＷＸＹＺ]')
let w:zenkaku = matchadd('Zenkaku', '[ａｂｃｄｅｆｇｈｉｊｋｌｍｎｏｐｑｒｓｔｕｖｗｘｙｚ]')
let w:zenkaku = matchadd('Zenkaku', '[　０１２３４５６７８９]')

