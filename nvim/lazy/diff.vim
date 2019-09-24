" From: filetype.vim

set diffopt=iwhite,vertical
setl wrap

" Note: some syntax have no reproducibility.
"let s:colorscheme = g:colors_name
"colorscheme gruvbox
"augroup DiffMyAutoConf
"au! BufWinLeave,BufLeave * exe 'colorscheme ' . s:colorscheme
"augroup END

"if bufexists(bufname('*/.git/*'))
"  " Todo: Make it work; still winbufnr~~ is ignored.
"  exe winbufnr(bufnr('*/.git/*/')) . 'windo setl bt=quickfix'
"endif
