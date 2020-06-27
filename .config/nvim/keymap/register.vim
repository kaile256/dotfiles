" From: init.vim

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
nnoremap <expr> s 'x'. v:count1 .(col('.') == col('$') - 1 ? 'a' : 'i')
nnoremap <expr> S 'X'. v:count1 .'i'

" Note: Not so often you want to delete words into clipboard.
nmap     <space>d "_d
nnoremap <space>D "_D
nnoremap <space>c "_c
nnoremap <space>C "_C

" Tips: Keep <space>d in noremap
nnoremap <silent><expr> dk
      \ 'd'
      \ . (line('.') == line('$') ? 'k' : 'kk')
      \ .':silent! call repeat#set("dk")<CR>'

" Note: Leave xmaps for 'x/s' for add/asterisk.vim.
xnoremap <space>d "_d
xnoremap <space>D "_D
xnoremap <space>c "_c
xnoremap <space>C "_C

" nnoremap <expr> d (v:register ==# '"') ? '"_d' : 'd'
" nnoremap <expr> D (v:register ==# '"') ? '"_D' : 'D'
" nnoremap <expr> c (v:register ==# '"') ? '"_c' : 'c'
" nnoremap <expr> C (v:register ==# '"') ? '"_C' : 'C'
" nnoremap <expr> x (v:register ==# '"') ? '"_x' : 'x'
" nnoremap <expr> X (v:register ==# '"') ? '"_X' : 'X'
" nnoremap <expr> s (v:register ==# '"') ? '"_s' : 's'
" nnoremap <expr> S (v:register ==# '"') ? '"_Xi' : 'Xi'
"
" xnoremap <expr> d (v:register ==# '"') ? '"_d' : 'd'
" xnoremap <expr> D (v:register ==# '"') ? '"_D' : 'D'
" xnoremap <expr> c (v:register ==# '"') ? '"_c' : 'c'
" xnoremap <expr> C (v:register ==# '"') ? '"_C' : 'C'

" Note: xmaps to x/s are applied in add/asterisk.vim
" xnoremap <expr> x (v:register ==# '') ? '"_x' : 'x'
" xnoremap <expr> X (v:register ==# '') ? '"_X' : 'X'
" xnoremap <expr> s (v:register ==# '') ? '"_s' : 's'
" xnoremap <expr> S (v:register ==# '') ? '"_Xi' : 'Xi'

" Unnamed Register; Convenience "{{{1
" CAUTION: Just Type p to put from unnamed register.
cnoremap <c-r><c-'> <c-r>"
cnoremap <c-r>'     <c-r>"
cnoremap <c-r><c-\> <c-r>"
cnoremap <c-r>\     <c-r>"
