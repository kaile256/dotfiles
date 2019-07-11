" git add
noremap          <a-g><a-a> :<c-u>Gw<cr>echo ":w & staged!!"<cr>
noremap          <a-g><a-w> :<c-u>Gw<cr>echo ":w & staged!!"<cr>
" git commit
noremap <silent> <a-g><a-c> :<c-u>Gcommit<cr>
" git diff
noremap <silent> <a-g><a-d> :<c-u>Gdiff<cr>
" git blame
noremap <silent> <a-g><a-b> :<c-u>Gblame<cr>
