
" TODO: inc/dec for hex color on guifg/bg
onoremap <silent> gv :<c-u>norm! gv<cr>
xnoremap zo zogv
xnoremap zO zOgv
xnoremap zc zcgv
xnoremap zC zCgv
xnoremap zr zrgv
xnoremap zR zRgv
xnoremap zm zmgv
xnoremap zM zMgv
xnoremap <c-x> <c-x>gv
xnoremap <c-a> <c-x>gv
" Note: keep recursive for coc.nvim.
xmap <silent> = =:norm! gv<cr>
xnoremap > >gv
" TODO: Make v_< work as I expect.
"xnoremap < <Cmd>norm! <gv
