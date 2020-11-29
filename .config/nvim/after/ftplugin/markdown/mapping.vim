
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

nnoremap <buffer><silent><buffer> <SID>(header-increment) :<C-u>silent! undojoin<CR>I#<Esc>
nnoremap <buffer><silent><buffer> <SID>(header-decrement) :<C-u>silent! undojoin<CR>^"_x
nnoremap <expr><silent><buffer> +
      \ (getline('.') =~# '^\s*#\+ \S')
      \ ? '<SID>(header-increment)'
      \ : '+'

nnoremap <expr><silent><buffer> -
      \ (getline('.') =~# '^\s*#\+\s\S')
      \ ? '<SID>(header-decrement)'
      \ : (getline('.') =~# '- \[ ]')
      \ ? ':<c-u>silent! undojoin <bar> keeppattern s/\[ ]/\[x]<cr>'
      \ : (getline('.') =~? '- \[\a]')
      \ ? ':<c-u>silent! undojoin <bar> keeppattern s/\[\a]\c/\[ ]<cr>'
      \ : '-'


