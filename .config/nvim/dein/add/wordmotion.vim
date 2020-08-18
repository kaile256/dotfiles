" TOML: motion.toml
" Repo: chaoren/vim-wordmotion
" Another: source/wordmotion.vim

" Leave keys in upper case (W, E, B) as default behaviors.
noremap Q gE
sunmap Q

" Motions in lower case
map w <Plug>WordMotion_w
map e <Plug>WordMotion_e
map b <Plug>WordMotion_b
map q <Plug>WordMotion_ge

sunmap w
sunmap e
sunmap b
sunmap q

" Textobj
xmap ie <Plug>WordMotion_iw
xmap iE <Plug>WordMotion_iW
xmap ae <Plug>WordMotion_aw
xmap aE <Plug>WordMotion_aW

omap ie <Plug>WordMotion_iw
omap iE <Plug>WordMotion_iW
omap ae <Plug>WordMotion_aw
omap aE <Plug>WordMotion_aW

cmap <C-r><C-e> <Plug>WordMotion_<C-r><C-w>
cmap <C-r><C-q> <Plug>WordMotion_<C-r><C-a>
