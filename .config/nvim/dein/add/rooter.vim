" TOML: default.toml
" Repo: airblade/vim-rooter
" Another: source/rooter.vim

augroup myRooterAdd-updatePathToFind
  au BufNewFile,BufRead * call s:update_path()
  function! s:update_path() abort
    let root_dir = FindRootDirectory()
    if &l:path =~# root_dir | return | endif
    if root_dir ==# $HOME || root_dir ==# '/' | return | endif
    exe 'setlocal path^='. root_dir .'/**'
  endfunction
augroup END

function! s:set_in_reg(target) abort
  const reg = v:register ==# '"' ? '+' : v:register
  call setreg(reg, a:target)
  echo a:target 'in @'. reg
endfunction

function! s:repo() abort
  return fnamemodify(FindRootDirectory(), ':s_.*/\ze[^/]*/[^/]*__')
endfunction
nnoremap <silent> <SID>(yank-repo)
      \ :<C-u>call <SID>set_in_reg(<SID>repo())<CR>
noremap! <expr> <SID>(paste-repo) <SID>repo()
nmap y<C-g><C-r> <SID>(yank-repo)
map! <C-r><C-g><C-r> <SID>(paste-repo)
