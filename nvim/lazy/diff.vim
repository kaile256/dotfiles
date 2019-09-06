" From: filetype.vim

set diffopt=iwhite,vertical
setl wrap

nnoremap <buffer><silent> dq :diffoff!<cr>

"if bufexists(bufname('*/.git/*'))
"  " Todo: Make it work; still winbufnr~~ is ignored.
"  exe winbufnr(bufnr('*/.git/*/')) . 'windo setl bt=quickfix'
"endif
