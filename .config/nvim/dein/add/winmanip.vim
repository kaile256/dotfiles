" TOML: default.toml
" Repo: yaronkh/vim-winmanip

let g:winmanip_disable_key_mapping = 1

" Note: `<Plug>(JumpFoo)` is only a set of wrappers to `:wincmd [hjkl]`.
" nmap <silent> 1<Right> <Plug>(JumpRight)
" nmap 1<Left>  <Plug>(JumpLeft)
" nmap 1<Down>  <Plug>(JumpDown)
" nmap 1<Up>    <Plug>(JumpUp)

" " <Plug>(MoveBufBar) exchanges buffers to the next window.
" nmap <Plug>(winmanip-move-buf-right) <Plug>(MoveBufRight)
" nmap <Plug>(winmanip-move-buf-left)  <Plug>(MoveBufLeft)
" nmap <Plug>(winmanip-move-buf-down)  <Plug>(MoveBufDown)
" nmap <Plug>(winmanip-move-buf-up)    <Plug>(MoveBufUp)

" " <Plug>(MoveJumBufpBaz) do <Plug>(MoveBufQux) with cursor.
" nmap 3<Right> <Plug>(MoveJumpBufRight)
" nmap 3<Left>  <Plug>(MoveJumpBufLeft)
" nmap 3<Down>  <Plug>(MoveJumpBufDown)
" nmap 3<Up>    <Plug>(MoveJumpBufUp)

" <Plug>(MoveWinToQuuxTab) moves window to another tab.
nmap <C-w>l <Plug>(MoveWinToNextTab)
nmap <C-w>h <Plug>(MoveWinToPrevTab)
nmap <C-w><C-w> <C-w>l
nmap <C-w><C-w> <C-w>h

" " <Plug>(CopyBufCorge) copy buf to next existing window.
" nmap 5<Right> <Plug>(CopyBufRight)
" nmap 5<Left>  <Plug>(CopyBufLeft)
" nmap 5<Down>  <Plug>(CopyBufDown)
" nmap 5<Up>    <Plug>(CopyBufUp)

" " <Plug>(CopyBufGrault) do <Plug>(CopyBufCorge) with cursor.
" nmap 6<Right> <Plug>(CopyJumpBufRight)
" nmap 6<Left>  <Plug>(CopyJumpBufLeft)
" nmap 6<Down>  <Plug>(CopyJumpBufDown)
" nmap 6<Up>    <Plug>(CopyJumpBufUp)

" " <Plug>(MaximizeWin) toggles maximize-window mode.
" nmap \z <Plug>(MaximizeWin)

" nmap <silent> <Leader>B <Plug>(ClearAllWindows)
" nmap <silent> <Leader>b <Plug>(ClearBufferList)

