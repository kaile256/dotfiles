" From: init.vim

" Alt-ESC {{{1
inoremap <silent> <a-space> <esc>:call feedkeys("\<space>")<cr>
inoremap <silent> <a-\> <esc>:call feedkeys('\')<cr>
inoremap <silent> <a-q> <esc>:call feedkeys('q')<cr>
inoremap <silent> <a-U> <esc>:call feedkeys('U')<cr>
inoremap <silent> <a-.> <esc>:call feedkeys('.')<cr>
inoremap <silent> <a-~> <esc>:call feedkeys('~')<cr>

" i/a/o "{{{2
" <a-ai> could be just <left>/<right>, but I prefer <esc> before.
inoremap <a-O> <esc>O
inoremap <a-o> <esc>o
inoremap <a-I> <c-g>U<Home>
inoremap <a-A> <c-g>U<End>
inoremap <a-a> <c-g>U<Right>
inoremap <a-i> <c-g>U<Left>
"inoremap <a-I> <c-g>U<esc>I
"inoremap <a-A> <c-g>U<esc>A
"inoremap <a-a> <c-g>U<esc>la
"inoremap <a-i> <c-g>U<esc>i

" h/j/k/l {{{2
" CAUTION: Never careless mapping on <i_a-hjkl>
" CAUTION: Remember n_<a-hjkl> for Win-Leap
" For: make sure <a-hjkl> work as <esc>hjkl, e.g., while pop-up menu shows.
" Note: <a-h> behaves as <esc> is more instinctive than <esc>h.
inoremap <a-h> <esc>
inoremap <silent> <a-j> <esc>:call feedkeys('j')<cr>
inoremap <silent> <a-k> <esc>:call feedkeys('k')<cr>
inoremap <silent> <a-l> <esc>:call feedkeys('l')<cr>

" w/e/b {{{2
inoremap <silent> <a-W> <esc>:call feedkeys('W')<cr>
inoremap <silent> <a-B> <esc>:call feedkeys('B')<cr>
inoremap <silent> <a-E> <esc>:call feedkeys('E')<cr>
inoremap <silent> <a-w> <esc>:call feedkeys('w')<cr>
inoremap <silent> <a-b> <esc>:call feedkeys('b')<cr>
inoremap <silent> <a-e> <esc>:call feedkeys('e')<cr>

" f/t/;/, {{{2
inoremap <silent> <a-F> <esc>:call feedkeys('F')<cr>
inoremap <silent> <a-f> <esc>:call feedkeys('f')<cr>
inoremap <silent> <a-T> <esc>:call feedkeys('T')<cr>
inoremap <silent> <a-t> <esc>:call feedkeys('t')<cr>
inoremap <silent> <a-;> <esc>:call feedkeys(';')<cr>
inoremap <silent> <a-,> <esc>:call feedkeys(',')<cr>
inoremap <silent> <a-/> <esc>:call feedkeys('/')<cr>
inoremap <silent> <a-'> <esc>:call feedkeys("'")<cr>
inoremap <silent> <a-`> <esc>:call feedkeys(``')<cr>
inoremap <silent> <a-*> <esc>:call feedkeys("*")<cr>
inoremap <silent> <a-#> <esc>:call feedkeys('#')<cr>

" registers {{{2
inoremap <silent> <a-P> <c-g>u<esc>:call feedkeys('P')<cr>
inoremap <silent> <a-p> <c-g>u<esc>:call feedkeys('p')<cr>
inoremap <silent> <a-c-r> <esc><c-r>

inoremap <silent> <a-"> <esc>:call feedkeys('"')<cr>
inoremap <silent> <a-Y> <esc>y$
inoremap <silent> <a-X> <esc>:call feedkeys('X')<cr>
inoremap <silent> <a-D> <esc>:call feedkeys('D')<cr>
inoremap <silent> <a-C> <esc>:call feedkeys('C')<cr>
inoremap <silent> <a-y> <esc>:call feedkeys('y')<cr>
inoremap <silent> <a-x> <esc>:call feedkeys('x')<cr>
inoremap <silent> <a-d> <esc>:call feedkeys('d')<cr>
inoremap <silent> <a-c> <esc>:call feedkeys('c')<cr>
inoremap <silent> <a-u> <esc>:call feedkeys('u')<cr>

" Undo Break; {{{1
inoremap <a-P> <c-g>u<esc>:call feedkeys('P')<cr>

"" Undo Break; New Line
"inoremap <c-j> <c-g>u<c-j>
"inoremap <c-m> <c-g>u<c-m>
" Undo Break; Backspace
inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>
" Undo Break; Put
"inoremap <c-r> <c-g>u<c-r>
"inoremap <c-x> <c-g>u<c-x>
" Undo Break; Insert Previously's
"inoremap <c-a> <c-g>u<c-a>
" Note: i_<c-@> sometimes behaves as :qa!
"inoremap <c-@> <c-g>u<c-@>
" Undo Break; Digraph
"inoremap <c-k> <c-g>u<c-k>
" Undo Break; Non-Digit
"inoremap <c-q> <c-g>u<c-q>
"inoremap <c-v> <c-g>u<c-v>


augroup AdditionalUndoBreakOnFileType "{{{
  au!
  au FileType html,markdown inoremap <buffer> , ,<c-g>u
  au FileType html,markdown inoremap <buffer> . .<c-g>u
  au FileType html,markdown inoremap <buffer> ! !<c-g>u
  au FileType html,markdown inoremap <buffer> ? ?<c-g>u
augroup END "}}}

