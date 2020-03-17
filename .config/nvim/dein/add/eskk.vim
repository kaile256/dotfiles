" From: japanese.toml
" Repo: tyru/eskk.vim
" Another: source/eskk.vim

" Note: <a-space> works in the same way as <esc>l.
" lmap for Insert, Command-line, Lang-Arg
" Note: Vim regards <C-_> as <C-/>
inoremap <expr> <c-_> eskk#enable()
cnoremap <expr> <c-_> eskk#enable()
