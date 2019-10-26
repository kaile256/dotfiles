" From: init.vim

" Jump; via Tags
" Note: g<c-]> jumps via ctags,
"       or if <cword> links more than two tags, shows a list of tags.
noremap <c-]> g<c-]>zz
" Note: stjump means split-tag-jump.
noremap <silent> g<c-]> :<c-u>vert stjump <c-r><c-w><CR>zz

" Jump; to Definition on &path
" if a number follows filename/path, jump to the linenumber on the buffer:
"     init.vim:10
"     init.vim @ 20
"     init.vim (30)
"     /init.vim 40
nnoremap <silent> gf gF
xnoremap <silent> gf gF
" in horizontal
nnoremap <silent> <c-w>f <c-w>F
xnoremap <silent> <c-w>f <c-w>F

" Note: sfind denys range and to follow number.
nnoremap <silent> <c-w><space>f :<c-u>vert wincmd F<cr>
" Note: :vert forbids any range, keep using <Cmd>.
xnoremap <silent> <c-w><space>f <Cmd>vert wincmd F<cr>

" in new tab
nnoremap <silent> <c-w>F <c-w>gF
xnoremap <silent> <c-w>F <c-w>gF
nnoremap <silent> gF <c-w>gF
xnoremap <silent> gF <c-w>gF

