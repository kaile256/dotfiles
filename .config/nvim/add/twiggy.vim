" From: fugitive.toml
" Repo: sodapopcan/vim-twiggy
" Ref: add/merginal.vim
" Another: source/twiggy.vim

command! -complete=custom,TwiggyCompleteBranches -range -addr=lines -nargs=* Gbranch
      \ :Twiggy

" Mnemonic: the char 'y' looks like branch.
" range could be only dicided in g:twiggy_num_columns
noremap <silent> <a-y> :<c-u> Twiggy<cr>
