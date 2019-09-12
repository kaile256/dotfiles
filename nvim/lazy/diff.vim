" From: filetype.vim

set diffopt=iwhite,vertical
setl wrap

nnoremap <buffer><silent> dq :diffoff!<cr>
" Put/Get only selected lines.
xnoremap <buffer><silent> dp :diffput<cr>
xnoremap <buffer><silent> do :diffget<cr>

"if bufexists(bufname('*/.git/*'))
"  " Todo: Make it work; still winbufnr~~ is ignored.
"  exe winbufnr(bufnr('*/.git/*/')) . 'windo setl bt=quickfix'
"endif
