scriptencoding utf-8
" From: init.vim

hi Zenkaku cterm=reverse,bold,undercurl gui=reverse,bold,undercurl

" Note: matchadd({group}, {pattern}[, {priority}[, {id} [, {dict}]]]) only works
"       on the current window.
let w:zenkakuNumber = matchadd('Zenkaku', '[　０１２３４５６７８９]')
let w:zenkakuLower  = matchadd('Zenkaku', '[ａｂｃｄｅｆｇｈｉｊｋｌｍｎｏｐｑｒｓｔｕｖｗｘｙｚ]')
let w:zenkakuUpper  = matchadd('Zenkaku', '[ＡＢＣＤＥＦＧＨＩＪＫＬＭＮＯＰＱＲＳＴＵＶＷＸＹＺ]')
