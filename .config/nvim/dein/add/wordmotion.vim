" TOML: motion.toml
" Repo: chaoren/vim-wordmotion
" Another: source/wordmotion.vim

noremap gw w
noremap ge e
noremap gb b
noremap gq ge

sunmap gw
sunmap ge
sunmap gb
sunmap gq

xnoremap igw iw
xnoremap igW iW
xnoremap agw aw
xnoremap agW aW

onoremap igw iw
onoremap igW iW
onoremap agw aw
onoremap agW aW

map w <Plug>WordMotion_w
map e <Plug>WordMotion_e
map b <Plug>WordMotion_b
map q <Plug>WordMotion_ge

map W <Plug>WordMotion_W
map E <Plug>WordMotion_E
map B <Plug>WordMotion_B
map Q <Plug>WordMotion_gE

sunmap w
sunmap e
sunmap b
sunmap q

sunmap W
sunmap E
sunmap B
sunmap Q

" Textobj {{{1
xmap iw <Plug>WordMotion_iw
xmap iW <Plug>WordMotion_iW
xmap aw <Plug>WordMotion_aw
xmap aW <Plug>WordMotion_aW

omap iw <Plug>WordMotion_iw
omap iW <Plug>WordMotion_iW
omap aw <Plug>WordMotion_aw
omap aW <Plug>WordMotion_aW

cmap <C-r><C-a> <Plug>WordMotion_<C-r><C-a>
cmap <C-r><C-w> <Plug>WordMotion_<C-r><C-w>
cnoremap <C-r>A <C-r><C-a>
cnoremap <C-r>W <C-r><C-w>
