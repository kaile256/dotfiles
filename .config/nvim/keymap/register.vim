" From: init.vim

nmap <space> "_
xmap <space> "_

nmap <expr> <CR> &bt ==# '' ? '"' : '<CR>'
xmap <expr> <CR> &bt ==# '' ? ' " : '<CR>'

nnoremap <silent> <SID>(yank-path)
      \ :<C-u>call setreg(v:register ==# '"' ? '+' : v:register, expand('%:p'))
      \ <bar> echo '"%:p" is '. expand('%:p')<CR>
cnoremap <expr> <SID>(paste-path) expand('%:p')
nmap y<C-g> <SID>(yank-path)
cmap <C-r><C-g> <SID>(paste-path)

nnoremap <silent> <SID>(yank-bufnr)
      \ :<C-u>call setreg(v:register ==# '"' ? '+' : v:register, bufnr('%'))
      \ <bar> echo 'bufnr("%") is '. bufnr("%")<CR>
cnoremap <expr> <SID>(paste-bufnr) bufnr('%')
nmap y<C-b> <SID>(yank-bufnr)
cmap <C-r><C-b> <SID>(paste-bufnr)

" nnoremap p p`]
" nnoremap p ]p`]
nnoremap P ]P

nnoremap <SID>(xp-repeatable) :<C-u>call repeat#set(":undojoin\<lt>CR>\"_xp")<CR>
nmap <expr><silent> p
      \ ((@" ==# @-) ? '<SID>(xp-repeatable)' : '')
      \ .']p`]'

" Command-Line Register {{{1
cnoremap <c-r><c-;> <c-r>:
cnoremap <c-r>;     <c-r>:
" Plus Register; Yank {{{1
"function! s:yank_cursor_keeping(reg) abort
"  let save_view = winsaveview()
"  call feedkeys("\<esc>".'"'. a:reg .'y')
"  augroup BackToThePosition
"    au! TextYankPost * call winrestview(save_view) | silent! augroup! BackToThePosition
"  augroup END
"endfunction
"nnoremap <silent> y :call <SID>yank_cursor_keeping(v:register)<cr>
nnoremap <space>y "+y
xnoremap <space>y "+y
nnoremap <space>Y "+y$
xnoremap <space>Y "+y$
" Plus Register; Put {{{1
nnoremap <space>p "+]p`]
xnoremap <space>p "+]p
nnoremap <space>P "+]P
xnoremap <space>P "+]P
" Yank Register {{{1
nnoremap Y y$

" nnoremap <s-space>p "0]p
xnoremap <s-space>p "0]p
" nnoremap <s-space>P "0]P
xnoremap <s-space>P "0]P

" Black-Hole Register {{{1
nnoremap dD 0d$
nnoremap <silent><expr> dk
      \ 'd'.
      \ (line('.') == line('$') ? 'k' : 'kk')
      \ .':silent! call repeat#set("dk")<CR>'

" nnoremap <expr> d (v:register ==# '"') ? '"_d' : 'd'
" nnoremap <expr> D (v:register ==# '"') ? '"_D' : 'D'
" nnoremap <expr> c (v:register ==# '"') ? '"_c' : 'c'
" nnoremap <expr> C (v:register ==# '"') ? '"_C' : 'C'

" xnoremap <expr> d (v:register ==# '"') ? '"_d' : 'd'
" xnoremap <expr> D (v:register ==# '"') ? '"_D' : 'D'
" xnoremap <expr> c (v:register ==# '"') ? '"_c' : 'c'
" xnoremap <expr> C (v:register ==# '"') ? '"_C' : 'C'

" Unnamed Register; Convenience "{{{1
" CAUTION: Just Type p to put from unnamed register.
cnoremap <c-r><c-'> <c-r>"
cnoremap <c-r>'     <c-r>"
cnoremap <c-r><c-\> <c-r>"
cnoremap <c-r>\     <c-r>"
