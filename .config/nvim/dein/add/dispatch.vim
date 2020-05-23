" TOML: debug.toml
" Repo: tpope/vim-dispatch
" Another: source/dispatch.vim

nnoremap <silent> <SID>(dispatch)
      \ :<c-u>write
      \ <bar>Dispatch! -dir=<c-r>=expand('%:p:h')<cr><cr>

nnoremap <script> `<CR> <SID>(dispatch)
