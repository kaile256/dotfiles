" From: nvim/init.vim

""" Redraw
"" Indent
nnoremap <S-TAB> gg=G''zz

" CAUTION: <c-l> should be run at LAST so that no corruption.
" CAUTION: zR (open all fold) makes vim FREEZE.
"" Ref: showmarks.vimrc
inoremap <silent> <c-l>         <c-o>:<c-u>noh <cr><c-o><c-l>
nnoremap <silent> <c-space><space>   :<c-u>noh <cr><c-l>
nnoremap <silent> <c-space><c-space> :<c-u>noh <cr><c-l>
" <a-space> gets along with <a-hjkl>.
nnoremap <silent> <space><space>     :cclose <cr>

"" Move Window
nnoremap <c-w>h <c-w>H
nnoremap <c-w>j <c-w>J
nnoremap <c-w>k <c-w>K
nnoremap <c-w>l <c-w>L

""" Resize
nnoremap <A-left>  <c-w>>
nnoremap <A-down>  <c-w>-
nnoremap <A-up>    <c-w>+
nnoremap <A-right> <c-w><
nnoremap <C-left>  <c-w>>
nnoremap <C-down>  <c-w>-
nnoremap <C-up>    <c-w>+
nnoremap <C-right> <c-w><
" another-resize commands
nnoremap <a->> <c-w>>
nnoremap <a--> <c-w>-
nnoremap <a-+> <c-w>+
nnoremap <a-<> <c-w><
" agressive resize
nnoremap <c-w>m     <c-w>_
nnoremap <c-w><c-m> <c-w>_<c-w>|
" neutralize
nnoremap <c-w>0 <c-w>=
