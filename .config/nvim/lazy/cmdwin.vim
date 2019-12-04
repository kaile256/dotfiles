" From: init.vim

noremap <silent><buffer> <a-k>      :<c-u>close<cr>
noremap <silent><buffer> <c-w>c     :<c-u>close<cr>
noremap <silent><buffer> <c-w><c-c> :<c-u>close<cr>

noremap <silent><buffer> Zq :<c-u>close<cr>
noremap <silent><buffer> ZQ :<c-u>close<cr>
noremap <silent><buffer> Zz :<c-u>close<cr>
noremap <silent><buffer> ZZ :<c-u>close<cr>

noremap <silent><buffer> <space> :<c-u>close <bar> call feedkeys("\<space>")<cr>

inoremap <buffer> <c-d> <esc>:quit<cr>
