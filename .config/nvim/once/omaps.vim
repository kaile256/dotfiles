" From: init.vim

" abort to move while operator {{{1
" h/j/k/l {{{2
onoremap <silent> <a-h> <ESC>:call feedkeys('h')<cr>
onoremap <silent> <a-j> <ESC>:call feedkeys('j')<cr>
onoremap <silent> <a-k> <ESC>:call feedkeys('k')<cr>
onoremap <silent> <a-l> <ESC>:call feedkeys('l')<cr>

" w/e/b {{{2
onoremap <silent> <a-w> <ESC>:call feedkeys('w')<cr>
onoremap <silent> <a-b> <ESC>:call feedkeys('b')<cr>
onoremap <silent> <a-e> <ESC>:call feedkeys('e')<cr>
onoremap <silent> <a-W> <ESC>:call feedkeys('W')<cr>
onoremap <silent> <a-B> <ESC>:call feedkeys('B')<cr>
onoremap <silent> <a-E> <ESC>:call feedkeys('E')<cr>

" f/t/;/, {{{2
onoremap <silent> <a-F> <ESC>:call feedkeys('F')<cr>
onoremap <silent> <a-f> <ESC>:call feedkeys('f')<cr>
onoremap <silent> <a-T> <ESC>:call feedkeys('T')<cr>
onoremap <silent> <a-t> <ESC>:call feedkeys('t')<cr>
onoremap <silent> <a-;> <ESC>:call feedkeys(';')<cr>
onoremap <silent> <a-,> <ESC>:call feedkeys(',')<cr>
