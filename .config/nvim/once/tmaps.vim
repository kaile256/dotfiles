" From: init.vim

"" TODO: more accurate pattern to ':' in ternminal
"" Note: currently no use, why?
"tnoremap <expr> : (getline('.')[col('.')] ==# ' ' && getline('.')[col('.') - 2] ==# ' ')? '<c-\><c-n>:' : ':'

tnoremap <c-x>h     ~/
tnoremap <c-x><c-h> ~/

" before typo
tnoremap <c-cr> <cr>

" Alt-Esc {{{1
tnoremap <a-:> <c-\><c-n>:
tnoremap <silent> <a-space> <c-\><c-n>:call feedkeys("\<space>")<cr>

" hjkl
" <a-b> is useful on bash
tnoremap <silent> <a-h> <c-\><c-n>:call feedkeys('h')<cr>
tnoremap <silent> <a-j> <c-\><c-n>:call feedkeys('j')<cr>
tnoremap <silent> <a-k> <c-\><c-n>:call feedkeys('k')<cr>
tnoremap <silent> <a-l> <c-\><c-n>:call feedkeys('l')<cr>

" ftFt
" Note: <a-t> is used in fzf to open in new tab
tnoremap <silent> <a-f> <c-\><c-n>:call feedkeys('f')<cr>
"tnoremap <silent> <a-t> <c-\><c-n>:call feedkeys('t')<cr>
tnoremap <silent> <a-F> <c-\><c-n>:call feedkeys('F')<cr>
tnoremap <silent> <a-T> <c-\><c-n>:call feedkeys('T')<cr>
tnoremap <silent> <a-;> <c-\><c-n>:call feedkeys(';')<cr>
tnoremap <silent> <a-,> <c-\><c-n>:call feedkeys(',')<cr>

" Jump Anyway by <c-i><c-o> {{{1
" Note: consider fzf's keybindings on shell
"tmap <c-i> <c-\><c-n><c-i>
"tmap <c-o> <c-\><c-n><c-o>
"tmap <a-i> <c-\><c-n><a-i>
"tmap <a-o> <c-\><c-n><a-o>
"tmap <a-p> <c-\><c-n><a-p>
"tmap <a-n> <c-\><c-n><a-n>
