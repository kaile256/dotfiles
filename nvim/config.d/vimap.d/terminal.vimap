if has('nvim') || ('terminal') 
  """" CONFIG
  """ Color
  set termguicolors

  """" KEYMAP
  """ Normal Mode
  "" Open Shortcut
  nnoremap <silent> <space>te :<c-u>        :te<cr>
  nnoremap <silent> <space>ts :<C-u>sp<CR>  :te<CR>
  nnoremap <silent> <space>tv :<C-u>vs<CR>  :te<CR>
  nnoremap <silent> <space>tb :<C-u>tabe<CR>:te<CR>

  """ Terminal Mode
  "" ESC
  " esc in the same way as in the other mode.
  tnoremap <c-[> <c-\><c-n>
  tnoremap <ESC> <c-\><c-n>

  "" Alt as ESC as in Insert Mode
  " esc & hjkl
  tnoremap <a-h> <c-\><c-n>h
  tnoremap <a-j> <c-\><c-n>j
  tnoremap <a-k> <c-\><c-n>k
  tnoremap <a-l> <c-\><c-n>l

  " esc & backward
  tnoremap <a-w> <c-\><c-n>w
  tnoremap <a-b> <c-\><c-n>b
endif

