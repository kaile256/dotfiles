" From: external.toml
" Repo: xavierchow/vim-sequence-diagram

"command! Seq :call vim_seq_diag#Generate_diagram(resolve(expand('<sfile>:p:h')) )<CR>
command! Seq :norm <Plug>GenerateDiagram<cr>


