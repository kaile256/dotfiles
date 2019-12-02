" From: init.vim

" TODO: more accurate pattern to ':' in ternminal
tnoremap <expr> : (getline('.')[col('.')] ==# ' ' && getline('.')[col('.') - 2] ==# ' ')? '<c-\><c-n>:' : ':'
" Keymap; ESC & Alt {{{
tnoremap <a-:> <c-\><c-n>:
" esc & hjkl
" <a-b> is useful on bash
tnoremap <silent> <a-h> <c-\><c-n>:call feedkeys('h')<cr>
tnoremap <silent> <a-j> <c-\><c-n>:call feedkeys('j')<cr>
tnoremap <silent> <a-k> <c-\><c-n>:call feedkeys('k')<cr>
tnoremap <silent> <a-l> <c-\><c-n>:call feedkeys('l')<cr>
"}}}
" Keymap; Jump Anyway by <c-i><c-o> {{{
" Note: consider fzf's keybindings on shell
"tmap <c-i> <c-\><c-n><c-i>
"tmap <c-o> <c-\><c-n><c-o>
"tmap <a-i> <c-\><c-n><a-i>
"tmap <a-o> <c-\><c-n><a-o>
"tmap <a-p> <c-\><c-n><a-p>
"tmap <a-n> <c-\><c-n><a-n>

tnoremap <silent> <a-space> <esc><c-\><c-n>:call feedkeys("\<space>")<cr>
" CAUTION: both f/t is used to move cursor in terminal
"tnoremap <silent> <a-f> <c-><c-n>:call feedkeys('f')<cr>
"tnoremap <silent> <a-t> <c-><c-n>:call feedkeys('t')<cr>
tnoremap <silent> <a-F> <c-><c-n>:call feedkeys('F')<cr>
tnoremap <silent> <a-T> <c-><c-n>:call feedkeys('T')<cr>
tnoremap <silent> <a-;> <c-><c-n>:call feedkeys(';')<cr>
tnoremap <silent> <a-,> <c-><c-n>:call feedkeys(',')<cr>
"}}}

" before typo
tnoremap <C-CR> <cr>
