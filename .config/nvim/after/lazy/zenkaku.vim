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


hi! OperatorNot ctermfg=15 guifg=#ffffff cterm=bold gui=bold
let w:syntax_operator_not = matchadd('OperatorNot', '\s\zs!\ze\s\=\h')
" hi! operatorNot cterm=strikethrough gui=strikethrough
" let w:syntax_operator_not = matchadd('OperatorNot', '\s\zs\%(! \?\|not \)\h.*\ze\%($\|&&\|and\|or\|then\)')

let s:annotations = [
      \ 'CAUTION',
      \ 'DEBUG',
      \ 'FIXME',
      \ 'HACK',
      \ 'NOTE',
      \ 'NOTICE',
      \ 'OPTIMIZE',
      \ 'REVIEW',
      \ 'TODO',
      \ 'Tips',
      \ 'WARNING',
      \ 'XXX',
      \ ]

let s:annotations = '\c \zs\('. join(s:annotations, '\|') .'\)\ze: '
let w:syntax_annotation = matchadd('TODO', s:annotations)
unlet s:annotations


hi! link OperatorTernary Identifier
let w:syntax_ternary_operator_first  = matchadd('OperatorTernary', ' \zs?\ze .* : ')
let w:syntax_ternary_operator_second = matchadd('OperatorTernary', ' ? .* \zs:\ze ')


hi! FooBar cterm=bold,undercurl gui=bold,undercurl
let s:foobar = [
      \ 'foobar',
      \ 'foo',
      \ 'bar',
      \ 'baz',
      \ 'qux',
      \ 'quux',
      \ 'corge',
      \ 'grault',
      \ 'garply',
      \ 'waldo',
      \ 'fred',
      \ 'plugh',
      \ 'xyzzy',
      \ 'thud',
      \ ]
let s:foobar = '\c\<\('. join(s:foobar, '\|') .'\)\>\ze\s*='
let w:syntax_foobar = matchadd('FooBar', s:foobar)
unlet s:foobar


" hi! link Semicolon NonText
" let w:syntax_semicolon = matchadd('Semicolon', ';$')
