" From: japanese.toml
" Repo: tyru/eskk.vim
" Another: source/eskk.vim

" Note: <a-space> works in the same way as <esc>l.
" lmap for Insert, Command-line, Lang-Arg
inoremap <expr> <c-space> eskk#enable()
cnoremap <expr> <c-space> eskk#enable()
