" From: init.vim

" Note: Put as in Insert Mode
tnoremap <expr> <c-r> '<c-\><c-n>"'.nr2char(getchar()).'pi'

"augroup MyPasteToggle
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
tnoremap <C-R><c-space> <C-\><C-N>"+pi
tnoremap <C-R><space>   <C-\><C-N>"+pi
" Plus Register; Yank {{{1
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
cnoremap <c-r><c-space> <c-r>+
cnoremap <c-r><space>   <c-r>+
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
nnoremap <s-space>c "_c
nnoremap <s-space>C "_C
"nnoremap <s-space>x "_x
"nnoremap <s-space>X "_X
nnoremap <s-space>s "_s
nnoremap <s-space>S "_S
" Unnamed Register; Convenience "{{{1
" CAUTION: Just Type p to put from unnamed register.
cnoremap <c-r><c-'> <c-r>"
cnoremap <c-r>'     <c-r>"
cnoremap <c-r><c-\> <c-r>"
cnoremap <c-r>\     <c-r>"
