" TOML: browse.toml
" Repo: zgpio/tree.nvim
" Another: post/tree.vim

nnoremap <silent> <A-x>l :<C-u>Tree
      \ -columns=mark:git:indent:icon:filename:size:time
      \ -split=vertical
      \ -direction=topleft
      \ -winwidth=38
      \ -listed
      \ -search=`expand('%:p')`
      \ `expand('%:p:h')`<CR>

