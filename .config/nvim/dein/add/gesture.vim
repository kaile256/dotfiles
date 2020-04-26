" TOML: motion.toml
" Repo: notomo/gesture.nvim
" Another: post/gesture.vim

noremap <silent> <LeftMouse>   :<C-u>GestureDraw<CR>
noremap <silent> <LeftDrag>    :<C-u>GestureDraw<CR>
noremap <silent> <LeftRelease> :<C-u>GestureFinish<CR>
