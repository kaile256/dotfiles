" From: init.vim

" Note: Put as in Insert Mode
tnoremap <expr> <c-r> '<c-\><c-n>"'.nr2char(getchar()).'pi'

"augroup myPasteToggle
"  " CAUTION: when set paste, @+ is ignored.
"  au!
"  au InsertEnter,CmdLineEnter * silent! setl nopaste
"  au BufWinEnter,WinEnter,InsertLeave * silent! setl paste
"augroup END

" Indent Adjustment
nnoremap p ]p`]
nnoremap P ]P

" Command-Line Register {{{1
cnoremap <c-r><c-;> <c-r>:
cnoremap <c-r>;     <c-r>:
" Plus Register; Terminal {{{1
tnoremap <c-r><c-space> <c-\><c-n>"+pi
tnoremap <c-r><space>   <c-\><c-n>"+pi
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
" Plus Register; Delete {{{1
nnoremap <space>d "+d
nnoremap <space>D "+D
nnoremap <space>c "+c
nnoremap <space>C "+C
" Plus Register; Put {{{1
nnoremap <space>p "+p`]
xnoremap <space>p "+p
nnoremap <space>P "+P
xnoremap <space>P "+P
" Plug Register; One Char {{{1
" Use vim-sumode
"nnoremap <space>x   "+x
"nnoremap <space>s   "+s
"nnoremap <space>X   "+X
" Yank Register; Paste
tnoremap <c-r><c-0> <c-\><c-n>"0pi
cnoremap <c-r><c-0> <c-r>0
nnoremap <s-space>p "0p
xnoremap <s-space>p "0p
nnoremap <s-space>P "0P
xnoremap <s-space>P "0P
" Black-Hole Register {{{1
nnoremap <s-space>d "_d
nnoremap <s-space>D "_D
" Note: those won't be typed intending to put at all, especially in noremal-mode
nnoremap c "_c
nnoremap C "_C
nnoremap s "_s
nnoremap S "_S
"nnoremap <s-space>x "_x
"nnoremap <s-space>X "_X
" Unnamed Register; Convenience "{{{1
" CAUTION: Just Type p to put from unnamed register.
cnoremap <c-r><c-'> <c-r>"
cnoremap <c-r>'     <c-r>"
cnoremap <c-r><c-\> <c-r>"
cnoremap <c-r>\     <c-r>"
