" From: init.vim

onoremap <silent> gv :<c-u>norm! gv<cr>

onoremap <expr> ia "\<ESC>". v:operator .'a'
onoremap <expr> ai "\<ESC>". v:operator .'a'

" Usual Expect {{{1
onoremap Y <esc>y$
onoremap D <esc>D
onoremap C <esc>C

" Make default linewise.
" TODO: leave a blank line when ':norm d{ or d}'
onoremap { V{k
onoremap } V}
onoremap [z V[z
onoremap ]z V]z

" For: startinsert mode even from visual mode or operator-pending mode.
onoremap <a-a> <esc>a
onoremap <a-i> <esc>i

" Select only a character under the cursor.
onoremap <CR> l
onoremap <NL> l

" TODO: make <k/dk dot-repeatable
onoremap <expr> k
      \ (v:operator == 'y')? 'kj':
      \ (v:operator == 'd')? 'kk':
      \ (v:operator == '<')? '<esc>Vko<':
      \ 'k'
" Abort to move in Operator {{{1
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

