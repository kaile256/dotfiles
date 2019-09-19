" From: nvim/init.vim

"if execute('map <c-w>q') != '' || execute('map <c-w><c-q>') != ''
"  noremap <c-w>q <Nop>
"  noremap <c-w><c-q> <Nop>
"endif
nnoremap <c-w>Q :<c-u>qa! <cr>
nnoremap <c-w>Z :<c-u>qa  <cr>

" Redraw; Indent
" :retab! Replace all whitespaces and tabs according to tabstop/expandtab.
"nnoremap <S-TAB>  gg=G''zz

" Redraw; No Highlight
inoremap <silent> <c-l>         <c-o>:<c-u>noh <cr><c-o><c-l>
nnoremap <silent> <c-space><space>   :<c-u>noh <cr><c-l>
nnoremap <silent> <c-space><c-space> :<c-u>noh <cr><c-l>
nnoremap <silent> <space><space>     :cclose <bar> lclose <cr>

" Close; Tab-page
noremap <silent> <c-w>C :<c-u>tabclose<cr>

" Move Window
nnoremap <c-w>h <c-w>H
nnoremap <c-w>j <c-w>J
nnoremap <c-w>k <c-w>K
nnoremap <c-w>l <c-w>L

" Resize
nnoremap <C-left>  <c-w>>
nnoremap <C-down>  <c-w>-
nnoremap <C-up>    <c-w>+
nnoremap <C-right> <c-w><
nnoremap <A-left>  <c-w>>
nnoremap <A-down>  <c-w>-
nnoremap <A-up>    <c-w>+
nnoremap <A-right> <c-w><

" Resize; Neutralize
nnoremap <c-w>0 <c-w>=
