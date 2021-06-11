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

nnoremap <silent><buffer> <M-k> :<C-u>close<CR>
