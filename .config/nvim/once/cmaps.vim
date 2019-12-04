" From: init.vim
" Ref: cabbrs.vim
" Ref: commands.vim

cnoremap <silent> <a-space> <esc>:call feedkeys("\<space>")<cr>
" c_<c-f> to open cmd-win
cnoremap <silent> <a-:> <c-f>
cnoremap <silent> <a-q> <c-f>

cnoremap <silent> <a-h> <c-c><c-w>h
cnoremap <silent> <a-j> <c-c><c-w>j
cnoremap <silent> <a-k> <c-c>
cnoremap <silent> <a-l> <c-c><c-w>l

" Note: <c-k> enter digraph when mistyped
cnoremap <silent> <c-k><a-k> <c-c>

cnoremap <c-r><c-space> <c-r>+
cnoremap <c-r><space>   <c-r>+

" instant :verbose "{{{1
cnoremap <silent> <a-m>  <Home>:verbose<space><cr>
cnoremap <silent> <a-cr> <Home>:verbose<space><cr>

" emacs-like motions {{{1
cnoremap <c-a> <home>
cnoremap <a-f> <S-right>
cnoremap <c-f> <right>
cnoremap <c-b> <left>
cnoremap <a-b> <S-left>
cnoremap <c-d> <Del>
