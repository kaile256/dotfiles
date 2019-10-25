" From: myplug.toml
" Repo: kaile256/vim-keymaps-dealer
" Another: post/keymaps-dealer.vim

" g:keymapsDL_cd_path_dict is also extended by
"     1. rc/dein.vim
"     2. rc/variables.vim
call extend(g:keymapsDL_cd_path_dict, {
      \ 'h': '~',
      \ 'w': '%:p:h',
      \ '.': '.',
      \ '': '~',
      \ })

let g:keymapsDL_split_dict = {
      \ '<a-v>': 'vsplit',
      \ '<a-s>': 'split',
      \ '<a-t>': 'tabe',
      \ '<a-e>': 'edit',
      \ }

