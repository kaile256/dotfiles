" git add
noremap <silent> <space>ga :<c-u>Gw<cr>:echo ":w & staged!!"<cr>
noremap <silent> <space>gw :<c-u>Gw<cr>:echo ":w & staged!!"<cr>
" git commit
noremap <space>gc :<c-u>Gcommit -m '
noremap <space>gm :<c-u>Gcommit -m '
" git diff
noremap <silent> <space>gd :<c-u>Gdiff<cr>
" git blame
noremap <silent> <space>gb :<c-u>Gblame<cr>
