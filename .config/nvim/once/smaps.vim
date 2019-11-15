" From: insert.toml
" Ref: neosnippet.vim
" Ref: ultisnips.vim

if get(g:, 'loaded_smaps', 0) | finish | endif
let g:loaded_smaps = 1

snoremap <silent> <a-h> <esc>:call feedkeys('h')<cr>
snoremap <silent> <a-j> <esc>:call feedkeys('j')<cr>
snoremap <silent> <a-k> <esc>:call feedkeys('k')<cr>
snoremap <silent> <a-l> <esc>:call feedkeys('l')<cr>

" Put Register on Snippet Expanding
snoremap <silent> <c-r> <space><BS><esc>:call feedkeys("\<c-r>")<cr>
snoremap <c-r><c-space> <space><BS><c-r>+
snoremap <c-r><space>   <space><BS><c-r>+
snoremap <c-h>          <space><BS>

snoremap <a-h> <space><BS><esc>h
snoremap <a-j> <space><BS><esc>j
snoremap <a-k> <space><BS><esc>k
snoremap <a-l> <space><BS><esc>l

" Alt-ESC; registers {{{1
snoremap <silent> <a-P> <space><BS><c-g>u<esc>:call feedkeys('P')<cr>
snoremap <silent> <a-p> <space><BS><c-g>u<esc>:call feedkeys('p')<cr>

snoremap <silent> <a-Y>   <space><BS><esc>y$
snoremap <silent> <a-X>   <space><BS><esc>:call feedkeys('X')<cr>
snoremap <silent> <a-D>   <space><BS><esc>:call feedkeys('D')<cr>
snoremap <silent> <a-C>   <space><BS><esc>:call feedkeys('C')<cr>
snoremap <silent> <a-y>   <space><BS><esc>:call feedkeys('y')<cr>
snoremap <silent> <a-x>   <space><BS><esc>:call feedkeys('x')<cr>
snoremap <silent> <a-d>   <space><BS><esc>:call feedkeys('d')<cr>
snoremap <silent> <a-c>   <space><BS><esc>:call feedkeys('c')<cr>
snoremap <silent> <a-u>   <space><BS><esc>:call feedkeys('u')<cr>
snoremap <silent> <a-c-r> <space><BS><esc><c-r>

" Note: 'U' respects vi-compatible way of `uu`.
snoremap <a-U> <esc>U
snoremap <a-P> <c-g>u<esc>P
