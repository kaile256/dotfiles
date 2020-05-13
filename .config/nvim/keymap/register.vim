" From: init.vim

"augroup myPasteToggle
"  " CAUTION: when set paste, @+ is ignored.
"  au!
"  au InsertEnter,CmdLineEnter * silent! setl nopaste
"  au BufWinEnter,WinEnter,InsertLeave * silent! setl paste
"augroup END

" Indent Adjustment
"nnoremap p p`]
nnoremap p ]p`]
nnoremap P ]P

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
" Plug Register; One Char {{{1
" Use vim-submode
"nnoremap <space>x "+x
"nnoremap <space>s "+s
"nnoremap <space>X "+X

" Yank Register {{{1
nnoremap Y y$
cnoremap <c-r><c-0> <c-r>0
" nnoremap <s-space>p "0]p
xnoremap <s-space>p "0]p
" nnoremap <s-space>P "0]P
xnoremap <s-space>P "0]P

" Black-Hole Register {{{1
" Note: those won't be typed intending to put at all, especially in noremal-mode
nnoremap <space>s "_s
" Note: `S` deletes all the current line
nnoremap <space>S "_Xi
" Note: not so often you want to delete words into clipboard
nnoremap <space>d "_d
nnoremap <space>D "_D
nnoremap <space>c "_c
nnoremap <space>C "_C
nnoremap <space>x "_x
nnoremap <space>X "_X

" Unnamed Register; Convenience "{{{1
" CAUTION: Just Type p to put from unnamed register.
cnoremap <c-r><c-'> <c-r>"
cnoremap <c-r>'     <c-r>"
cnoremap <c-r><c-\> <c-r>"
cnoremap <c-r>\     <c-r>"
