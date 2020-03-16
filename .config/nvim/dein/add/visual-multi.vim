" From: motion.toml
" Repo: mg979/vim-visual-multi

let g:VM_custom_noremaps = {}
let g:VM_custom_remaps   = {}

" TODO: distinguish the start key from the <Plug>.
" Hint: replace the map, <c-n>, mg979/vim-visual-multi/autoload/vm/maps/all.vim @53
nmap <c-n> <Plug>(VM-Find-Under)
xmap <C-n> <Plug>(VM-Find-Subword-Under)

"let g:VM_check_mappings  = 0
"let g:VM_default_mappings= 0

"let g:VM_mouse_mappings  = 1

"function! s:temp_replace_maps(map_cmd, key, n_cmd) abort
"  nnoremap <replace> k k
"endfunction
