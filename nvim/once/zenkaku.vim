scriptencoding utf-8
" From: init.vim

" Highlight all Zenkaku Charactars
highlight Zenkaku cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta

let w:m1 = matchadd("Zenkaku", '[　０１２３４５６７８９]')
let w:m2 = matchadd("Zenkaku", '[ａｂｃｄｅｆｇｈｉｊｋｌｍｎｏｐｑｒｓｔｕｖｗｘｙｚ]')
let w:m3 = matchadd("Zenkaku", '[ＡＢＣＤＥＦＧＨＩＪＫＬＭＮＯＰＱＲＳＴＵＶＷＸＹＺ]')
