" From: motion.toml


let g:textmanip_current_mode = 1
let g:textmanip_move_ignore_shiftwidth = 1
"let g:textmanip_move_shiftwidth = 2 " number of shiftwidth

let g:textmanip_hooks = {
      \ 'finish': ''
      \ } " Experimental: key should be 'finish' at present.

nmap yp <Plug>(textmanip-duplicate-down)
nmap yP <Plug>(textmanip-duplicate-up)
nmap <silent> cp :move +1<cr>
nmap <silent> cP :move -2<cr>

"xmap <a-k> <Plug>(textmanip-duplicate-up)
"xmap <a-j> <Plug>(textmanip-duplicate-down)
"xmap <a-l> <Plug>(textmanip-duplicate-left)
"xmap <a-h> <Plug>(textmanip-duplicate-right)

xmap <c-h> <Plug>(textmanip-move-left)
xmap <c-j> <Plug>(textmanip-move-down)
xmap <c-k> <Plug>(textmanip-move-up)
xmap <c-l> <Plug>(textmanip-move-right)

"nmap <space>j <Plug>(textmanip-toggle-mode)
"xmap <space>j <Plug>(textmanip-toggle-mode)
