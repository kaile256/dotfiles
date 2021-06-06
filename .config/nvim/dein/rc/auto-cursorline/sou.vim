" TOML: appearance.toml
" Repo: delphinus/vim-auto-cursorline

let g:auto_cursorline_wait_ms = 30000

augroup myAutoCursorline/addtionalCursorline
  au VimResized,FocusLost,FileChangedShell * setlocal cursorline
  au BufEnter,BufLeave * setlocal cursorline
augroup END
