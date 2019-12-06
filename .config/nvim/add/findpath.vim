" From: myplug.toml
" Repo: kaile256/vim-findpath

let g:findpath#no_default_keymaps     = 1
let g:findpath#parent_dir_trial_level = 1

"let g:findpath#search#alternate_bufname = 0
let g:findpath#search#ignore_words = ['import']

nnoremap <silent> gf :<c-u>FindPath<cr>zz
xnoremap <silent> gf :<c-u>FindPath<cr>zz

" in horizontal
nnoremap <silent> <c-w>f :<c-u>bel FindPath<cr>zz
xnoremap <silent> <c-w>f :<c-u>bel * FindPath<cr>zz

" in vertical
nnoremap <silent> <c-w><space>f :<c-u>vert FindPath<cr>zz
xnoremap <silent> <c-w><space>f :<c-u>vert * FindPath<cr>zz

" in a new tab
nnoremap <silent> gF     :<c-u>tab FindPath<cr>zz
nnoremap <silent> <c-w>F :<c-u>tab FindPath<cr>zz
xnoremap <silent> gF     :<c-u>tab * FindPath<cr>zz
xnoremap <silent> <c-w>F :<c-u>tab * FindPath<cr>zz
