
" Note: (MAYBE WRONG)
"   leave `*`, instead of `-`, for unorder list style at first. Though all
"   the `*` for list shall be replaced with `-` by prettier, the lint will say
"   nothing after the replacement.
"   Ref: markdownlint MD004 ul-style

inoremap <expr><buffer> *
     \ (getline('.')[:col('.')] !~# '[^* \t]')
     \ ? '- [ ] '
     \ : '*'

" FIXME: if matched, return true
inoremap <expr><buffer> #
     \ (getline('.') =~? '^\s*- \[\( \|x\)\]')
     \ && (getline('.')[col('.') - 4 : col('.')] !=# '()\[]')
     \ ? "[]()\<Left>"
     \ : '#'

nnoremap <buffer><silent><buffer> <SID>(header-increment) :<C-u>silent! undojoin<CR>I#<Esc>
nnoremap <buffer><silent><buffer> <SID>(header-decrement) :<C-u>silent! undojoin<CR>^"_x
nnoremap <buffer><silent><buffer> <SID>(task-done)   :<C-u>silent! undojoin <bar> keeppattern s/\[ ]/\[x]<CR>
nnoremap <buffer><silent><buffer> <SID>(task-undone) :<C-u>silent! undojoin <bar> keeppattern s/\[\a]\c/\[ ]<CR>

" Mnemonic: Further
nmap <expr><silent><buffer> zf
      \ (getline('.') =~# '^\s*#\+ \S')
      \ ? '<SID>(header-increment)'
      \ : '+'
" Mnemonic: Decrease
nmap <expr><silent><buffer> zd
      \ (getline('.') =~# '^\s*#\+\s\S')
      \ ? '<SID>(header-decrement)'
      \ : (getline('.') =~# '- \[ ]')
      \ ? '<SID>(task-done)'
      \ : (getline('.') =~? '- \[\a]')
      \ ? '<SID>(task-undone)'
      \ : '-'


