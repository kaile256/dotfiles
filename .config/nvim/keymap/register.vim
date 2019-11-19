" From: init.vim

" Note: Put as in Insert Mode
tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'
" Note: default <c-o>yy only inserts yy w/o yank.
inoremap <expr> <c-o>y '<esc>y'. nr2char(getchar()) .'gi'
inoremap <expr> <c-o><space>y '<esc>"+y'. nr2char(getchar()) .'gi'
" TODO: use register via <c-o>
"inoremap <expr> <c-o>" '<esc>"'. nr2char(getchar()) . nr2char(getchar()) .'gi'


"augroup MyPasteToggle
"  " CAUTION: when set paste, @+ is ignored.
"  au!
"  au InsertEnter,CmdLineEnter * silent! setl nopaste
"  au BufWinEnter,WinEnter,InsertLeave * silent! setl paste
"augroup END

" Sequential
nnoremap p p`]
"nnoremap gp p

" Command-Line Register {{{1
inoremap <c-r><c-;> <c-g>u<c-r>:
inoremap <c-r>;     <c-g>u<c-r>:
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
inoremap <c-r><c-space> <c-g>u<c-r>+
inoremap <c-r><space>   <c-g>u<c-r>+
cnoremap <c-r><c-space> <c-r>+
cnoremap <c-r><space>   <c-r>+
" Plug Register; One Char {{{1
" Use vim-sumode
"nnoremap <space>x   "+x
"nnoremap <space>s   "+s
"nnoremap <space>X   "+X
" Yank Register; Paste
tnoremap <c-r><c-0> <c-\><c-n>"0pi
inoremap <c-r><c-0> <c-g>u<c-r>0
cnoremap <c-r><c-0> <c-r>0
nnoremap <s-space>p "0p
xnoremap <s-space>p "0p
nnoremap <s-space>P "0P
xnoremap <s-space>P "0P
"command! -nargs=1 PasteWithoutPasteToggle :call append(line('.'), '' . <args>)
" Black-Hole Register {{{1
"nnoremap <s-space>d "_d
"nnoremap <s-space>D "_D
nnoremap <s-space>c "_c
nnoremap <s-space>C "_C
nnoremap <s-space>x "_x
nnoremap <s-space>X "_X
nnoremap <s-space>s "_s
nnoremap <s-space>S "_S
" Unnamed Register; Convenience "{{{1
" CAUTION: Just Type p to put from unnamed register.
inoremap <c-r><c-'> <c-g>u<c-r>"
inoremap <c-r>'     <c-g>u<c-r>"
inoremap <c-r><c-\> <c-g>u<c-r>"
inoremap <c-r>\     <c-g>u<c-r>"
cnoremap <c-r><c-'> <c-r>"
cnoremap <c-r>'     <c-r>"
cnoremap <c-r><c-\> <c-r>"
cnoremap <c-r>\     <c-r>"
