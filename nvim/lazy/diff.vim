" From: filetype.vim

set diffopt=iwhite,vertical
setl wrap

" Note: some syntax have no reproducibility.
"let s:colorscheme = g:colors_name
"colorscheme gruvbox
"augroup DiffMyAutoConf
"au! BufWinLeave,BufLeave * exe 'colorscheme ' . s:colorscheme
"augroup END

nnoremap <buffer><silent> dq :diffoff!<cr>
" Put/Get only SELECTED lines.
xnoremap <buffer><silent> dp :diffput<cr>
xnoremap <buffer><silent> do :diffget<cr>

"if bufexists(bufname('*/.git/*'))
"  " Todo: Make it work; still winbufnr~~ is ignored.
"  exe winbufnr(bufnr('*/.git/*/')) . 'windo setl bt=quickfix'
"endif
