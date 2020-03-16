" From: finder.toml
" Repo: zgpio/tree.nvim
" Another: post/tree.vim

nnoremap <silent> <c-x>v :<C-u>Tree
      \ -split=vertical
      \ -direction=topleft
      \ -winwidth=40
      \ -listed
      \ `expand('%:p:h')`<CR>

