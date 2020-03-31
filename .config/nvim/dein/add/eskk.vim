" From: japanese.toml
" Repo: tyru/eskk.vim
" Another: source/eskk.vim
" Another: post/eskk.vim

" Note: <a-space> works in the same way as <esc>l.
" lmap for Insert, Command-line, Lang-Arg
" Note: Vim regards <C-_> as <C-/>
noremap! <expr> <c-_> eskk#enable()

noremap! <expr> <D-z> eskk#enable()
noremap! <expr> <D-Tab> eskk#enable()
" TODO: enter kana mode directly
noremap! <expr> <D-q> eskk#enable()
