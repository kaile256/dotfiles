" From: init.vim

augroup myCmdWinLazy
  au!
  " Ref: https://qiita.com/monaqa/items/e22e6f72308652fc81e2
  "   Reduce the histroy
  au CmdWinEnter : g/^qa\?!\?$/d _
  au CmdWinEnter : g/^wq\?a\?!\?$/d _
  au CmdWinEnter : %s/\s\+$/e
  au CmdWinEnter : g/^\S\+$/d _
augroup END

noremap <silent><buffer> <a-k>      :<c-u>close<cr>
noremap <silent><buffer> <c-w>c     :<c-u>close<cr>
noremap <silent><buffer> <c-w><c-c> :<c-u>close<cr>

noremap <silent><buffer> Zq :<c-u>close<cr>
noremap <silent><buffer> ZQ :<c-u>close<cr>
noremap <silent><buffer> Zz :<c-u>close<cr>
noremap <silent><buffer> ZZ :<c-u>close<cr>

noremap <silent><buffer> <space> :<c-u>close <bar> call feedkeys("\<space>")<cr>

inoremap <buffer> <c-d> <esc>:quit<cr>

nnoremap <buffer> <CR> <CR>
inoremap <buffer> <CR> <CR>
