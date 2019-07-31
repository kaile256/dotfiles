"""" From: 'init.vim'
"""" CAUTION: Never careless mapping on <i_a-hjkl>

""" Kill Ambiguities
nnoremap Y y$

""" Refresh
"" Indent
nnoremap <S-TAB> gg=G''zz

"" Redraw
" CAUTION: <c-l> should be run at LAST so that no corruption.
" <c-l> is already used by window-leaping.
nnoremap [g:redraw] :<c-u>noh<cr><c-l>
" zR: open all fold
nmap [g:complete_redraw] zR:cclose<bar>:lclose<bar>retab<cr>[g:redraw]

"" Ref: showmarks.vimrc
nmap <silent> <c-space> [g:redraw]
nmap <silent> <a-space> [g:complete_redraw]

""" Write&Quit
" w! write even read-only file.
nnoremap          <space>w :<c-u>w<cr>
nnoremap <silent> <space>q :<c-u>q<cr>
nnoremap          <space>x :<c-u>w!<cr>
nnoremap <silent> <space>z :<c-u>q!<cr>
"" Special
nnoremap <space>* :<c-u>qa<cr>
nnoremap <space>! :w !sudo tee % > /dev/null<cr> <bar> edit!
"" Buffer
nnoremap <silent> qq :<c-u>bdelete %<cr>
nnoremap <silent> q1 :<c-u>bdelete %<cr>

"" Move Window
nnoremap <c-w>h <c-w>H
nnoremap <c-w>j <c-w>J
nnoremap <c-w>k <c-w>K
nnoremap <c-w>l <c-w>L

""" Resize
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
