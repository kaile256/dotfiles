" Init: ftplugin/gitcommit/init.vim
" RUNTIME: $VIMRUNTIME/ftplugin/gitcommit.vim

if b:gitcommit_type !=? 'new' | finish | endif

norm! gg

" Note:
" Just for a syntax problem, `:startinsert` should be written at the last line.
startinsert

