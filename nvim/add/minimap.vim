" From: tool.toml
" Repo: severin-lemaignan/vim-minimap

" MinimapToggle has buggy on unindended close:
"   1. if the window is close, in spite of the state, the plugin know, is open.
"       NvimError: Cursor position outside buffer
nnoremap <silent> <a-m> :silent! MinimapToggle<cr>

augroup MinimapClose
  " TODO: :MinimapClose, when no buffer of minimap.
  "au! BufWinLeave * if expand("%:p") =~# 'vim-minimap' | MinimapClose | endif
augroup END
