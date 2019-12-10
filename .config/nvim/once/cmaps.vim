" From: init.vim
" Ref: cabbrs.vim
" Ref: commands.vim

cnoremap <silent> <a-space> <esc>:call feedkeys("\<space>")<cr>

" Note: <c-k> enter digraph when mistyped
cnoremap <silent> <c-k><a-k> <c-c>

cnoremap <c-r><c-space> <c-r>+
cnoremap <c-r><space>   <c-r>+

" instant :verbose "{{{1
cnoremap <expr> <a-m>  (getcmdtype() == ':' && getcmdline() !~# '^verb\%[ose]') ? '<Home>verbose<space><cr>' : '<cr>'
cnoremap <expr> <a-cr> (getcmdtype() == ':' && getcmdline() !~# '^verb\%[ose]') ? '<Home>verbose<space><cr>' : '<cr>'
cnoremap <expr> <a-j>  (getcmdtype() == ':' && getcmdline() !~# '^verb\%[ose]') ? '<Home>verbose<space><cr>' : '<cr>'

" Style; emacs-like motions {{{1
cnoremap <a-h> <c-c>
cnoremap <a-k> <c-c>
cnoremap <a-l> <c-c>

cnoremap <c-a> <home>
cnoremap <a-f> <S-right>
cnoremap <c-f> <right>
cnoremap <c-b> <left>
cnoremap <a-b> <S-left>
cnoremap <c-d> <Del>

"" Style; using cmdwin {{{1
"cnoremap <silent> <a-f> <c-f>:call feedkeys('f')<cr>
"cnoremap <silent> <a-t> <c-f>:call feedkeys('t')<cr>
"cnoremap <silent> <a-F> <c-f>:call feedkeys('F')<cr>
"cnoremap <silent> <a-T> <c-f>:call feedkeys('T')<cr>
"
"cnoremap <a-b> <c-f>B
"cnoremap <a-^> <c-f>^
"cnoremap <a-0> <c-f>0
"
"cnoremap <a-i> <c-f>i
"cnoremap <a-a> <c-f>a
"cnoremap <a-I> <c-f>I
"cnoremap <a-A> <c-f>A
