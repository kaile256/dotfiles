" From: init.vim

" on Term-mode
"" Term; Put as in Insert Mode
tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'

" Sequential
"nnoremap p gp
"nnoremap gp p

" Command-Line Register {{{
inoremap <c-r><c-;> <c-g>u<c-r>:
inoremap <c-r>;     <c-g>u<c-r>:
cnoremap <c-r><c-;> <c-r>:
cnoremap <c-r>;     <c-r>:
"}}}
" Black-Hole Register {{{
nnoremap <space>x   "_x
nnoremap <space>s   "_s
nnoremap <space>X   "_X
nnoremap <space>S   "_S
nnoremap <S-space>X "_X
nnoremap <S-space>S "_S
"}}}
" Plus Register; Terminal {{{
tnoremap <C-R><c-space> <C-\><C-N>"+pi
tnoremap <C-R><space>   <C-\><C-N>"+pi
"}}}
" Plus Register; Yank {{{
nnoremap <space>y "+y
xnoremap <space>y "+y
nnoremap <space>Y "+y$
xnoremap <space>Y "+y$
"}}}
" Plus Register; Delete {{{
nnoremap <space>d "+d
nnoremap <space>D "+D
nnoremap <space>c "+c
nnoremap <space>C "+C
"}}}
" Plus Register; Put {{{
nnoremap <space>p "+p']
xnoremap <space>p "+p
nnoremap <space>P "+P
xnoremap <space>P "+P
inoremap <c-r><c-space> <c-g>u<c-r>+
inoremap <c-r><space>   <c-g>u<c-r>+
cnoremap <c-r><c-space> <c-r>+
cnoremap <c-r><space>   <c-r>+
"}}}
" Yank Register; Convenience {{{
nnoremap Y y$
nnoremap yk ykj
nnoremap dk dkk
" Yank Register; Paste
tnoremap <c-r><c-0> <c-\><c-n>"0pi
inoremap <c-r><c-0> <c-g>u<c-r>0
cnoremap <c-r><c-0> <c-r>0
nnoremap <c-p>   "0p
nnoremap <c-s-p> "0P
vnoremap <c-p>   "0p
vnoremap <c-s-p> "0P
"}}}
" Unnamed Register; Convenience "{{{
" CAUTION: Just Type p to put from unnamed register.
inoremap <c-r><c-'> <c-g>u<c-r>"
inoremap <c-r>'     <c-g>u<c-r>"
inoremap <c-r><c-\> <c-g>u<c-r>"
inoremap <c-r>\     <c-g>u<c-r>"
cnoremap <c-r><c-'> <c-r>"
cnoremap <c-r>'     <c-r>"
cnoremap <c-r><c-\> <c-r>"
cnoremap <c-r>\     <c-r>"
"}}}
" Unnamed Register; QuickEdit {{{
" TODO: Do NOT mess up registers.
" TODO: use repeat.vim, i.e., dotrepeat.
nnoremap yP yyP
nnoremap yp yyp
nnoremap cp ddp
nnoremap cP ddkP
"nnoremap <silent><expr> 'cp' (@1 ==# @2)? '"_ddp' : 'ddp'
"nnoremap <silent><expr> 'cP' (@1 ==# @2)? '"_ddkp' : 'ddkP'
" TODO: paste after :append or pastetoggle
"nnoremap <expr> <space>p :append '<c-r>+<cr>'
" TODO: keymap via forloop
"let s:paste_r_listlist = [
"      \ ['<space>', '+'],
"      \ ['<c-0>', '0']
"      \ ]
"
"for [key, out] in s:paste_r_listlist
"  exe 'nnoremap <c-r><c-' . key . '> <c-g>u<c-r>' . out
"  exe 'nnoremap <c-r>'    . key . '> <c-g>u<c-r>' . out
"  exe 'cnoremap <c-r><c-' . key . '> <c-r>'       . out
"  exe 'cnoremap <c-r>'    . key . '> <c-r>'       . out
"endfor
"}}}
" Non-Register; but Expand {{{
"" Expand; the Name of Current Buffer w/o extention
cnoremap <c-r><c-b> <c-r>=expand('%:t:r')<cr>
cnoremap <c-r>b     <c-r>=expand('%:t:r')<cr>
""" Current Buffer; for such plugins as FZF, Denite, COC.
tnoremap <c-r><c-b> <c-\><c-n>"=expand('#:t:r')<cr>pi
tnoremap <c-r>b     <c-\><c-n>"=expand('#:t:r')<cr>pi
"}}}
