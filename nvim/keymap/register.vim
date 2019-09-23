" From: init.vim

" on Term-mode
"" Term; Put as in Insert Mode
tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'

"augroup MyPasteToggle
"  " CAUTION: when set paste, @+ is ignored.
"  au!
"  au InsertEnter,CmdLineEnter * silent! setl nopaste
"  au BufWinEnter,WinEnter,InsertLeave * silent! setl paste
"augroup END

" Sequential
"nnoremap p gp
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
nnoremap <space>p "+p']
xnoremap <space>p "+p
nnoremap <space>P "+P
xnoremap <space>P "+P
inoremap <c-r><c-space> <c-g>u<c-r>+
inoremap <c-r><space>   <c-g>u<c-r>+
cnoremap <c-r><c-space> <c-r>+
cnoremap <c-r><space>   <c-r>+
" Plug Register; One Char {{{1
nnoremap <space>x   "+x
nnoremap <space>s   "+s
nnoremap <space>X   "+X
nnoremap <space>S   "+S
" Yank Register; Convenience {{{1
nnoremap Y y$
nnoremap yk ykj
nnoremap dk dkk
" Yank Register; Paste
tnoremap <c-r><c-0> <c-\><c-n>"0pi
inoremap <c-r><c-0> <c-g>u<c-r>0
cnoremap <c-r><c-0> <c-r>0
nnoremap <space><space>p "0p
vnoremap <space><space>p "0p
nnoremap <space><space>P "0P
vnoremap <space><space>P "0P
"command! -nargs=1 PasteWithoutPasteToggle :call append(line('.'), '' . <args>)
" Black-Hole Register {{{1
nnoremap <space><space>d "_d
nnoremap <space><space>c "_c
nnoremap <space><space>x "_x
nnoremap <space><space>s "_s
nnoremap <space><space>D "_D
nnoremap <space><space>C "_C
nnoremap <space><space>X "_X
nnoremap <space><space>S "_S
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
" Unnamed Register; QuickEdit {{{1
" TODO: Do NOT mess up registers.
" TODO: use repeat.vim, i.e., dotrepeat.
nnoremap yP yyP
nnoremap yp yyp
nnoremap cp ddp
nnoremap cP ddkP
" TODO: paste after :append or pastetoggle
"nnoremap <silent><expr> 'cP' (getline('.') ==# @1)? '"_ddkp' : 'ddkP'
"nnoremap <silent><expr> 'cp' (getline('.') ==# @1)? '"_ddp' : 'ddp'
"nnoremap <expr> <space>p :append '<c-r>+<cr>'
