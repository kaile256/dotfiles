" From: init.vim

" Select current line without <NL>
xnoremap <expr> v (mode() ==# 'v') ? '<Esc>$v0' : 'v'

xmap <a-space> <Esc><Space>

xnoremap <a-a> <esc>a
xnoremap <a-i> <esc>i

xnoremap <silent> <a-h> <esc>:call feedkeys('h')<cr>
xnoremap <silent> <a-j> <esc>:call feedkeys('j')<cr>
xnoremap <silent> <a-k> <esc>:call feedkeys('k')<cr>
xnoremap <silent> <a-l> <esc>:call feedkeys('l')<cr>

" xnoremap ia <ESC>vi
" xnoremap ai <ESC>vi

xnoremap zo zogv
xnoremap zO zOgv
xnoremap zr zrgv
xnoremap zR zRgv
"xnoremap zc zcgv
"xnoremap zC zCgv
"xnoremap zm zmgv
"xnoremap zM zMgv

" Note: keep recursive for coc.nvim.
"xmap <silent> = =:norm! gv<cr>

" Note: Use dot repeat instead
"xnoremap <c-x> <c-x>gv
"xnoremap <c-a> <c-a>gv
"xnoremap > >gv
"xnoremap < <Cmd>norm! <gv
