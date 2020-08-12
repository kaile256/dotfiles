" TOML: default.toml
" Repo: airblade/vim-rooter
" Another: source/rooter.vim

augroup myRooterAdd-updatePathToFind
  au BufNewFile,BufRead * call s:update_path()
  function! s:update_path() abort
    let root_dir = FindRootDirectory()
    if &l:path =~# root_dir | return | endif
    if root_dir ==# $HOME || root_dir ==# '/' | return | endif
    let &l:path = root_dir .'/**,'. &path
  endfunction
augroup END

