" TOML: public.toml
" Repo: kaile256/boundary.nvim

noremap w <Cmd>lua require"boundary".goto.next.head()<CR>
noremap e <Cmd>lua require"boundary".goto.next.tail()<CR>
noremap b <Cmd>lua require"boundary".goto.prev.head()<CR>
noremap q <Cmd>lua require"boundary".goto.prev.tail()<CR>

noremap Q gE

onoremap ir <Cmd>lua require"boundary".textobj.i()<CR>
xnoremap ir <Cmd>lua require"boundary".textobj.i()<CR>
onoremap ar <Cmd>lua require"boundary".textobj.a()<CR>
xnoremap ar <Cmd>lua require"boundary".textobj.a()<CR>
