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

nnoremap <buffer><expr> <SID>(start-new-list-below)
      \ getline('.') =~# '^\s*- \[.]'
      \ ? 'o- [ ] '
      \ : getline('.') =~# '^\s*- '
      \   ? 'o- '
      \   : 'o'
nnoremap <buffer><expr> <SID>(start-new-list-above)
      \ getline('.') =~# '^\s*- \[.]'
      \ ? 'O- [ ] '
      \ : getline('.') =~# '^\s*- '
      \   ? 'O- '
      \   : 'O'
nmap <buffer> o <SID>(start-new-list-below)
nmap <buffer> O <SID>(start-new-list-above)

nnoremap <buffer><silent><buffer> <SID>(header-increment) :<C-u>silent! undojoin<CR>I#<Esc>
nnoremap <buffer><silent><buffer> <SID>(header-decrement) :<C-u>silent! undojoin<CR>^"_x
nnoremap <buffer><silent><buffer> <SID>(task-done)   :<C-u>silent! undojoin <bar> keeppattern s/\[ ]/\[x]/e<CR>
nnoremap <buffer><silent><buffer> <SID>(task-undone) :<C-u>silent! undojoin <bar> keeppattern s/\[\a]\c/\[ ]/e<CR>

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

