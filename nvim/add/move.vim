" From: motion.toml
" Repo: matze/vim-move

" TODO: make it as an operator to combinate w/ such as vim-easymotion.
let g:move_map_keys = 0

"let g:move_key_modifier = 'M' " M: Meta


let g:move_auto_indent = 0
"let g:move_past_end_of_line = 0 " 1: enable to move beyond the limit of the line.

vmap <a-h> <Plug>MoveBlockLeft
vmap <a-j> <Plug>MoveBlockDown
vmap <a-k> <Plug>MoveBlockUp
vmap <a-l> <Plug>MoveBlockRight

"nmap <a-h> <Plug>MoveCharLeft
nmap <a-j> <Plug>MoveLineDown
nmap <a-k> <Plug>MoveLineUp
"nmap <a-l> <Plug>MoveCharRight

xmap <a-d> <Plug>MoveBlockHalfPageDown
xmap <a-u> <Plug>MoveBlockHalfPageUp

nmap <a-d> <Plug>MoveLineHalfPageDown
nmap <a-u> <Plug>MoveLineHalfPageUp
