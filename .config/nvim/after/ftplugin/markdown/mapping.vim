" Note: (MAYBE WRONG)
"   leave `*`, instead of `-`, for unorder list style at first. Though all
"   the `*` for list shall be replaced with `-` by prettier, the lint will say
"   nothing after the replacement.
"   Ref: markdownlint MD004 ul-style

inoremap <expr><buffer> *
     \ getline('.') =~# '\s*'
     \ ? '- [ ] '
     \ : '*'
lnoremap <expr><buffer> *
      \ getline('.') =~# '\s*'
      \ ? '- [ ] '
      \ : '*'

nnoremap <buffer><silent><buffer> <SID>(header-increment) :<C-u>silent! undojoin<CR>I#<Esc>
nnoremap <buffer><silent><buffer> <SID>(header-decrement) :<C-u>silent! undojoin<CR>^"_x
nnoremap <buffer><silent><buffer> <SID>(task-done)   :<C-u>silent! undojoin <bar> keeppattern s/\[ ]/\[x]<CR>
nnoremap <buffer><silent><buffer> <SID>(task-undone) :<C-u>silent! undojoin <bar> keeppattern s/\[\a]\c/\[ ]<CR>

" Mnemonic: Further / Fill with mark
nmap <expr><silent><buffer> zf
      \ (getline('.') =~# '^\s*#\+ \S')
      \ ? '<SID>(header-increment)'
      \ : '<SID>(task-done)'
" Mnemonic: Decrease / Delete the mark
nmap <expr><silent><buffer> zd
      \ (getline('.') =~# '^\s*#\+\s\S')
      \ ? '<SID>(header-decrement)'
      \ : '<SID>(task-undone)'

