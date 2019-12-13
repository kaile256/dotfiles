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

cnoremap <a-q> <c-f>

" Open cmdwin {{{1
cnoremap <a-i> <c-f>i
cnoremap <a-a> <c-f>a
cnoremap <a-I> <c-f>I
cnoremap <a-A> <c-f>A

cnoremap <a-^> <c-f>^
cnoremap <a-0> <c-f>0
cnoremap <a-$> <c-f>$

" Style; emacs-like motions {{{1
" <a-j> for :verbose
cnoremap <a-h> <c-c>
cnoremap <a-k> <c-c>
cnoremap <a-l> <c-c>

cnoremap <c-a> <Home>
cnoremap <a-f> <S-Right>
cnoremap <c-f> <Right>
cnoremap <c-b> <Left>
cnoremap <a-b> <S-Left>
cnoremap <c-d> <Del>

" Style; vi-like to open cmdwin {{{1
"cnoremap <a-b> <c-f>B
"
" Note: no use below
"cnoremap <silent> <a-f> <c-f>:call feedkeys("\<esc>f")<cr>
"cnoremap <silent> <a-t> <c-f>:call feedkeys("\<esc>t")<cr>
"cnoremap <silent> <a-F> <c-f>:call feedkeys("\<esc>F")<cr>
"cnoremap <silent> <a-T> <c-f>:call feedkeys("\<esc>T")<cr>
