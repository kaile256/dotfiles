" TOML: default.toml
" Repo: svermeulen/vim-yoink
" Another: source/yoink.vim

" nmap [y <Plug>(YoinkRotateBack)
" nmap ]y <Plug>(YoinkRotateForward)

nmap <expr> <SID>(YoinkOlder)
      \ yoink#canSwap()
      \ ? '<Plug>(YoinkPostPasteSwapBack)'
      \ : '<Plug>(YoinkRotateBack)'
nmap <expr> <SID>(YoinkNewer)
      \ yoink#canSwap()
      \ ? '<Plug>(YoinkPostPasteSwapForward)'
      \ : '<Plug>(YoinkRotateForward)'

nnoremap <script> <c-,> <SID>(YoinkOlder)
nnoremap <script> <c-;> <SID>(YoinkNewer)

nmap <S-space>p <Plug>(YoinkPaste_p)
nmap <S-space>P <Plug>(YoinkPaste_P)

" weird
" nmap y <Plug>(YoinkYankPreserveCursorPosition)
" xmap y <Plug>(YoinkYankPreserveCursorPosition)
