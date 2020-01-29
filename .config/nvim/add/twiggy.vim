" From: fugitive.toml
" Repo: sodapopcan/vim-twiggy
" Ref: add/merginal.vim
" Another: source/twiggy.vim

" Mnemonic: the char 'y' looks like branch.
" range could be only dicided in g:twiggy_num_columns
noremap <silent> <a-y> :<c-u> Gbranch<cr>

command! -bar -range -addr=lines -nargs=*
      \ -complete=custom,TwiggyCompleteBranches
      \ Gbranch
      \ :call s:close_Gstat() |
      \ :Twiggy

function! s:close_Gstat() abort "{{{1
  let id    = win_getid()
  let gstat = bufwinnr(bufnr('\.git/index'))
  if gstat == -1 | return | endif
  exe gstat 'windo quit'
  call win_gotoid(id)
endfunction
