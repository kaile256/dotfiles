if has( 'nvim' || 'terminal' )
  "" Open Shortcut
  nnoremap <silent> <space>te :<c-u>        :te<cr>
  nnoremap <silent> <space>ts :<C-u>sp<CR>  :te<CR>
  nnoremap <silent> <space>tv :<C-u>vs<CR>  :te<CR>
  nnoremap <silent> <space>tb :<C-u>tabe<CR>:te<CR>

  "" ESC
  " esc in the same way as in the other mode.
  tnoremap <c-[> <c-\><c-n>
  tnoremap <ESC> <c-\><c-n>

  "" Alt as ESC as in Insert Mode
  " hjkl
  tnoremap <a-h> <c-\><c-n>h
  tnoremap <a-j> <c-\><c-n>j
  tnoremap <a-k> <c-\><c-n>k
  tnoremap <a-l> <c-\><c-n>l

  " hjkl
  tnoremap <a-w> <c-\><c-n>w
  tnoremap <a-b> <c-\><c-n>b

  " window leap
  tnoremap <a-c-h> <c-\><c-n><c-w>h
  tnoremap <a-c-j> <c-\><c-n><c-w>j
  tnoremap <a-c-k> <c-\><c-n><c-w>k
  tnoremap <a-c-l> <c-\><c-n><c-w>l
endif

