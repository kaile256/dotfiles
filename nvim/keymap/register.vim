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
" TODO: paste after :append or pastetoggle
"nnoremap <silent><expr> 'cP' (getline('.') ==# @1)? '"_ddkp' : 'ddkP'
"nnoremap <silent><expr> 'cp' (getline('.') ==# @1)? '"_ddp' : 'ddp'
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

function! s:tellme_operator_info() "{{{1
  " Excerpt of Help {{{2
  " v:event.operator: the operator's name in initial
  " string(v:event.regcontents): the lines of the contents that the register got in list.
  " v:event.regname: the register just used if it's NOT the 'unnamed' register.
  " v:event.regtype: register is now specified (:help getregtype())
  "}}}
  " Assign to the values {{{2
  let l:contents = string(v:event.regcontents)
  if v:event.operator ==# 'y'
    let l:operator = 'Yanked'
  elseif v:event.operator ==# 'd'
    let l:operator = 'Deleted'
  elseif v:event.operator ==# 'c'
    let l:operator = 'Changed'
  elseif v:event.operator ==# ''
    let l:operator = 'Done'
  else
    let l:operator = v:event.operator
  endif
  "}}}2
  " Echo info
  if v:event.regtype ==# 'v'
    echomsg ' '. l:operator .' in Characterwise: ' . l:contents
  elseif v:event.regtype ==# 'V'
    echomsg ' '. l:operator .' in Line: ' . l:contents
  elseif v:event.regtype =~# ''
    echomsg ' '. l:operator .' in Block: ' . l:contents
  else
    echomsg ' '. l:operator .' in an Unknown way: ' . l:contents
  endif
endfunction "}}}
augroup TellerOperatorInfo
  au!
  au TextYankPost * call <SID>tellme_operator_info()
augroup END
