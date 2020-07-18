" From: japanese.toml
" Repo: tyru/eskk.vim
" Another: source/eskk.vim
" Another: post/eskk.vim

set imdisable " no use on neovim or nvim-qt.

" Tips: Non-digit literal would be only required in Vimscript; Japanese is
" unnecessary in Vimscript where no one but I will read codes.
inoremap <expr> <C-v> (&ft ==# 'vim') ? '<C-v>' : eskk#enable()
" cnoremap <expr> <C-v> eskk#enable()

finish

" Note: <a-space> works in the same way as <esc>l.
" lmap for Insert, Command-line, Lang-Arg
" Note: Set <C-_> for <C-/>
noremap! <expr> <c-_> eskk#enable()
" Note: Set <C-S-_> for <C-_>
noremap! <expr> <C-S-_> eskk#enable()

