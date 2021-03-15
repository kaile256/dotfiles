" From: init.vim
" Another: lazy/terminal.vim
" Another: keymap/open_terminal.vim

"" TODO: more accurate pattern to ':' in ternminal
"" Note: currently no use, why?
"tnoremap <expr> : (getline('.')[col('.')] ==# ' ' && getline('.')[col('.') - 2] ==# ' ')? '<c-\><c-n>:' : ':'

" Most of prompts which ask passwords, yes/no and so on doesn't interpret <C-h>
" as <BS> but `^H` would be inserted instead.
tnoremap <C-h> <BS>

" col is different than in Normal mode (it may depend on the prompt width)
tnoremap <expr> ? (getline('.')[col('.')] ==# '~') ? '/' : '?'

tnoremap <silent> <SID>(highlight-off) <C-\><C-n>:<C-u>noh <bar> redraw!<CR>i<C-l>
tnoremap <script> <c-l> <SID>(highlight-off)

" Produce no terminfo-sequences
tnoremap <C--> -
tnoremap <c-cr> <cr>
tnoremap <S-Space> <space>

" Register {{{1
" Note: Put as in Insert Mode
tnoremap <expr> <c-r> '<c-\><c-n>"'.nr2char(getchar()).'pi'

" Yank Register
tnoremap <c-r><c-0> <c-\><c-n>"0pi

" Plus Register via <Space>
tnoremap <c-r><c-space> <c-\><c-n>"+pi
tnoremap <c-r><space>   <c-\><c-n>"+pi

" Expr Register
" Disturb to insert 'pi' in cmdline.
" TODO: Insert the result into prompt.
tnoremap <c-r>= <c-\><c-n>"=

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
"tnoremap <silent> <a-f> <c-\><c-n>:call feedkeys('f')<cr>
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
