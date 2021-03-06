" TOML: default.toml
" Repo: airblade/vim-rooter
" Another: source/rooter.vim

augroup myRooterAdd-updatePathToFind
  au BufNewFile,BufRead * call s:update_path()
  function! s:update_path() abort
    " Block upper-cased fnames for commit/pullreq etc.
    if expand('%:t') =~# '^\u\+' | return | endif

    try
      " Executed as an external program, nvim-qt sometimes throws `E117:
      " Unknown function` when Dein loads this plugin via `on_func`.
      let root_dir = FindRootDirectory()
    catch /E117/
      return
    endtry

    if &l:path !=# &g:path | return | endif
    if &l:path =~# root_dir | return | endif
    if root_dir ==# $HOME || root_dir ==# '/' | return | endif
    exe 'setlocal path^='. root_dir .'/**'
  endfunction
augroup END
