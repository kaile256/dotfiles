""" 0: Pressing f/t wilee Not clear the last Sneak search.
""" 1: Pressing f/t will reset Sneak so that ;/, will repeat f/t motion.
""let g:sneak#f_reset = 1
""let g:sneak#t_reset = 1
"""" Toggle sneak-clever-s
""let g:sneak#s_next = 0

" replace f with sceak
"map f <Plug>Sneak_s
"map F <Plug>Sneak_S

" replace f/t with one-char Sneak
noremap f <Plug>Sneak_f
noremap f <Plug>Sneak_F
noremap t <Plug>Sneak_t
noremap T <Plug>Sneak_T
