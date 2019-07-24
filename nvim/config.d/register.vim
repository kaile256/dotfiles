"""" From: 'init.vim'

"""" CONFIG
""" Session
augroup AutoSaveSession
  au! VimLeave * mksession!
augroup END

""" Clipboard
nnoremap <space>y "+y
xnoremap <space>y "+y
nnoremap <space>d "+d
xnoremap <space>d "+d
"" Paste
nnoremap <space>p "+p
xnoremap <space>p "+p
nnoremap <space>P "+P
xnoremap <space>P "+P

"" Black-Hole
nnoremap <a-x> "_x
nnoremap <a-d> "_d
nnoremap <a-D> "_D
nnoremap <a-c> "_c
nnoremap <a-C> "_C

