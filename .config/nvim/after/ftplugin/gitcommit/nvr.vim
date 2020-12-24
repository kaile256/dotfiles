" Repo: mhinz/neovim-remote

if !exists('b:nvr') | finish | endif

" Note: This file should be shared with ../gitconfig/, ../gitrebase/, etc., in
" symbolic links.

" Make sure to delete the written buffer to finish nvr.
setlocal bufhidden=delete

