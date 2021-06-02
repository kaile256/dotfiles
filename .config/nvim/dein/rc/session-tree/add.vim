" TOML: default.toml
" Repo: chinnkarahoi/vim-session-tree

nnoremap <silent> <C-w>u <Cmd>SessionUndo<CR>
nnoremap <silent> <C-w>U <Cmd>SessionRedo<CR>

" Note: Leave <C-w>r to go to reference, and :SessionRestore is supposed to be
" used at startup from shell according to its README.
" nnoremap <silent> <C-w>r     <Cmd>SessionRedo<CR>
" nnoremap <silent> <C-w><C-r> <Cmd>SessionRedo<CR>
" nnoremap <silent> <C-w>U     <Cmd>SessionRestore<CR>

augroup mySessionTree/Sou/ToggleSessionOptionsInEditing
  let s:save_ssop = &ssop
  set sessionoptions=
  set ssop+=buffers
  set ssop+=folds
  set ssop+=help
  set ssop+=localoptions
  set ssop+=options
  set ssop+=resize
  set ssop+=tabpages
  " set ssop+=terminal
  set ssop+=winpos
  set ssop+=winsize
  autocmd VimLeavePre let &ssop = s:save_ssop
augroup END
