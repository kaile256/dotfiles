" From: myplug.toml
" Repo: kaile256/vim-findpath

let g:findpath#no_default_keymaps = 1

nnoremap <silent> gf :FindPath<cr>zz
xnoremap <silent> gf :FindPath<cr>zz

" in horizontal
nnoremap <silent> <c-w>f :bel FindPath<cr>zz
xnoremap <silent> <c-w>f :bel FindPath<cr>zz

" in vertical
nnoremap <silent> <c-w><space>f :vert FindPath<cr>zz
xnoremap <silent> <c-w><space>f :vert FindPath<cr>zz

" in a new tab
nnoremap <silent> gF     :tab FindPath<cr>zz
xnoremap <silent> gF     :tab FindPath<cr>zz
nnoremap <silent> <c-w>F :tab FindPath<cr>zz
xnoremap <silent> <c-w>F :tab FindPath<cr>zz
