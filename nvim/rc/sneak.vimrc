" From: tool.toml

" TODO: no-default sneak keymap
" Make `sneak` unrepeatable, but just repeat as editted.

let g:sneak#prompt  = 'Sneak: {2} Chars >>> '
" 0: Pressing f/t will NOT clear the last Sneak search.
let g:sneak#s_next  = 0
let g:sneak#f_reset = 1
let g:sneak#t_reset = 1

" sneak#wrap('{operatorName}', {inputLength}, {reverse?}, {t/f}, {label})
"" operatorName; '{'':n,v:operator,visualmode()}
"" inputLength; {[0-n]}
"" reverse?; {0:forward,1:backward}
"" t/f; {0:t,1:f,2:/}
"" label; {0:never show sneak-label, 1:show labels for >=2 matches, 2:always}

" Table;                                  operator,     i, r, f, l
nnoremap <silent> f :<C-U>call sneak#wrap('',           2, 0, 1, 0)<CR>
nnoremap <silent> F :<C-U>call sneak#wrap('',           2, 1, 1, 0)<CR>
xnoremap <silent> f :<C-U>call sneak#wrap(visualmode(), 2, 0, 1, 0)<CR>
xnoremap <silent> F :<C-U>call sneak#wrap(visualmode(), 2, 1, 1, 0)<CR>
onoremap <silent> f :<C-U>call sneak#wrap(v:operator,   2, 0, 1, 0)<CR>
onoremap <silent> F :<C-U>call sneak#wrap(v:operator,   2, 1, 1, 0)<CR>
" Table;                                  operator,     i, r, f, l
nnoremap <silent> t :<C-U>call sneak#wrap('',           2, 0, 0, 0)<CR>
nnoremap <silent> T :<C-U>call sneak#wrap('',           2, 1, 0, 0)<CR>
xnoremap <silent> t :<C-U>call sneak#wrap(visualmode(), 2, 0, 0, 0)<CR>
xnoremap <silent> T :<C-U>call sneak#wrap(visualmode(), 2, 1, 0, 0)<CR>
onoremap <silent> t :<C-U>call sneak#wrap(v:operator,   2, 0, 0, 0)<CR>
onoremap <silent> T :<C-U>call sneak#wrap(v:operator,   2, 1, 0, 0)<CR>
