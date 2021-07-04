" TOML: public.toml
" Repo: kaile256/boundary.nvim

noremap Q gE
sunmap Q

noremap w <Cmd>lua require"boundary".goto.next.head()<CR>
noremap e <Cmd>lua require"boundary".goto.next.tail()<CR>
noremap b <Cmd>lua require"boundary".goto.prev.head()<CR>
noremap q <Cmd>lua require"boundary".goto.prev.tail()<CR>
sunmap w
sunmap e
sunmap b
sunmap q

onoremap ir <Cmd>lua require"boundary".textobj.i()<CR>
xnoremap ir <Cmd>lua require"boundary".textobj.i()<CR>
onoremap ar <Cmd>lua require"boundary".textobj.a()<CR>
xnoremap ar <Cmd>lua require"boundary".textobj.a()<CR>
