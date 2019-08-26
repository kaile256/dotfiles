"""" From: 'init.vim'

"""" CAUTION: never map on 0; that makes delay to 0-jump.
"""" CAUTION: never map on 9 for ambiguas-times macro executions.

""" Quit
nnoremap <silent>        1 :<c-u>q<cr>
nnoremap <silent> <space>1 :<c-u>q<cr>

""" Write
nnoremap                 2 :<c-u>w<cr>
nnoremap          <space>2 :<c-u>w<cr>
"" Write All
nnoremap <silent> <space>8 :<c-u>qa<cr>

""" Research
noremap 3 #
noremap 8 *
noremap 7 /

""" Jump
noremap 4 $
noremap 6 ^
noremap 5 %

noremap <c-6> <c-^>
