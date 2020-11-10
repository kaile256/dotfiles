
" Note: (MAYBE WRONG)
"   leave `*`, instead of `-`, for unorder list style at first. Though all
"   the `*` for list shall be replaced with `-` by prettier, the lint will say
"   nothing after the replacement.
"   Ref: markdownlint MD004 ul-style

"inoremap <expr><buffer> *
"      \ (getline('.')[:col('.')] !~# '[^* \t]')
"      \ ? '- [ ] '
"      \ : '*'
"
"" FIXME: if matched, return true
"inoremap <expr><buffer> #
"      \ (getline('.') =~? '^\s*- \[\( \|x\)\]')
"      \ && (getline('.')[col('.') - 4 : col('.')] !=# '()\[]')
"      \ ? "[]()\<Left>"
"      \ : '#'

inoreabbr <expr><buffer> *
      \ (getline('.')[:col('.')] !~# '[^* \t]')
      \ ? '- [ ]'
      \ : '*'

" FIXME: if matched, return true
inoreabbr <expr><buffer> #
      \ (getline('.') =~? '^\s*- \[\( \|x\)\]')
      \ && (getline('.')[col('.') - 4 : col('.')] !=# '()\[]')
      \ ? "[]()\<Left>"
      \ : '#'

nnoremap <expr><silent><buffer> +
      \ (getline('.') =~# '^\s*#\+ \S')
      \ ? ':<c-u>silent! undojoin<cr>I#<esc>'
      \ : '+'

nnoremap <expr><silent><buffer> -
      \ (getline('.') =~# '^\s*#\+\s\S')
      \ ? ':<c-u>silent! undojoin<cr>^"_x'
      \ : (getline('.') =~# '- \[ ]')
      \ ? ':<c-u>silent! undojoin <bar> keeppattern s/\[ ]/\[x]<cr>'
      \ : (getline('.') =~? '- \[\a]')
      \ ? ':<c-u>silent! undojoin <bar> keeppattern s/\[\a]\c/\[ ]<cr>'
      \ : '-'


