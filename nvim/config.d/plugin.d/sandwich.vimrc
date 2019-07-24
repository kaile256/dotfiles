"let g:sandwich_no_default_key_mappings = 1
"
""" Normal Mode
"" sa: add branckets
"nnoremap <space>s <Plug>(operator-sandwich-add)<Plug>(textobj-sandwich-auto-a)
"" sdb: delete branckets
"nnoremap <space>d <Plug>(operator-sandwich-delete)<Plug>(textobj-sandwich-auto-a)
"" srb: replace branckets
"nnoremap <space>r <Plug>(operator-sandwich-replace)<Plug>(textobj-sandwich-auto-a)
"
""" Visual Mode
"" sa
"xnoremap <space>s <Plug>(operator-sandwich-add)<esc>
"" sr
"xnoremap <space>r <Plug>(operator-sandwich-replace)<Plug>(textobj-sandwich-query-a)
"" sd
"xnoremap <space>d <Plug>(operator-sandwich-delete)<Plug>(textobj-sandwich-query-a)
