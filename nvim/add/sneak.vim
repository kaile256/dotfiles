" From: motion.toml
" Repo: justinmk/vim-sneak

hi! link Sneak      ErrorMsg
hi! link SneakScope ErrorMsg
hi! link SneakLabel ErrorMsg

let g:sneak#prompt  = 'Sneak: 1 Chars >> '

let g:sneak#s_next  = 0
" 0: Pressing f/t will repeat last motion as ;/,.
let g:sneak#f_reset = 1
let g:sneak#t_reset = 1

nmap f <Plug>Sneak_f
nmap F <Plug>Sneak_F

nmap t <Plug>Sneak_t
nmap T <Plug>Sneak_T

finish

" sneak#wrap('{operatorName}', {inputLength}, {reverse?}, {t/f}, {label})
"" operatorName; '{'':n,v:operator,visualmode()}
"" inputLength; {[0-n]}
"" reverse?; {0:forward,1:backward}
"" t/f; {0:t,1:f,2:/}
"" label; {0:never show sneak-label, 1:show labels for >=2 matches, 2:always}

" Table;                    operator,     i, r, f, l
" <Plug>Sneak_s: sneak#wrap('',           2, 0, 2, 1)
" <Plug>Sneak_S: sneak#wrap('',           2, 1, 2, 1)
" <Plug>Sneak_s: sneak#wrap(visualmode(), 2, 0, 2, 1)
" <Plug>Sneak_S: sneak#wrap(visualmode(), 2, 1, 2, 1)
" <Plug>Sneak_s: sneak#wrap(v:operator,   2, 0, 2, 1)
" <Plug>Sneak_S: sneak#wrap(v:operator,   2, 1, 2, 1)
""
""
""" 1-char 'enhanced f' sneak
" Table;                    operator,     i, r, f, l
" <Plug>Sneak_f: sneak#wrap('',           1, 0, 1, 0)
" <Plug>Sneak_F: sneak#wrap('',           1, 1, 1, 0)
" <Plug>Sneak_f: sneak#wrap(visualmode(), 1, 0, 1, 0)
" <Plug>Sneak_F: sneak#wrap(visualmode(), 1, 1, 1, 0)
" <Plug>Sneak_f: sneak#wrap(v:operator,   1, 0, 1, 0)
" <Plug>Sneak_F: sneak#wrap(v:operator,   1, 1, 1, 0)
""
""" 1-char 'enhanced t' sneak
" Table;                    operator,     i, r, f, l
" <Plug>Sneak_t: sneak#wrap('',           1, 0, 0, 0)
" <Plug>Sneak_T: sneak#wrap('',           1, 1, 0, 0)
" <Plug>Sneak_t: sneak#wrap(visualmode(), 1, 0, 0, 0)
" <Plug>Sneak_T: sneak#wrap(visualmode(), 1, 1, 0, 0)
" <Plug>Sneak_t: sneak#wrap(v:operator,   1, 0, 0, 0)
" <Plug>Sneak_T: sneak#wrap(v:operator,   1, 1, 0, 0)
"
" Table;                         operator,     i, r, f, l
" <Plug>SneakLabel_s: sneak#wrap('',           2, 0, 2, 2)
" <Plug>SneakLabel_S: sneak#wrap('',           2, 1, 2, 2)
" <Plug>SneakLabel_s: sneak#wrap(visualmode(), 2, 0, 2, 2)
" <Plug>SneakLabel_S: sneak#wrap(visualmode(), 2, 1, 2, 2)
" <Plug>SneakLabel_s: sneak#wrap(v:operator,   2, 0, 2, 2)
" <Plug>SneakLabel_S: sneak#wrap(v:operator,   2, 1, 2, 2)

""" repeat motion (explicit--as opposed to implicit 'clever-s')
" <Plug>Sneak_;: <SID>rpt('',             0)
" <Plug>Sneak_,: <SID>rpt('',             1)
" <Plug>Sneak_;: <SID>rpt(visualmode(),   0)
" <Plug>Sneak_,: <SID>rpt(visualmode(),   1)
" <Plug>Sneak_;: <SID>rpt(v:operator,     0)
" <Plug>Sneak_,: <SID>rpt(v:operator,     1)
