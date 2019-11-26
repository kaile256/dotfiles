" From: myplug.toml
" Repo: kaile256/vim-keymaps-dealer
" Another: post/keymaps-dealer.vim

" g:keymapsDL#cmd_after#cd_path_dict is also extended by
"     1. rc/dein.vim
"     2. rc/variables.vim
call extend(g:keymapsDL#cmd_after#cd_path_dict, {
      \ 'h': '~',
      \ 'w': '%:p:h',
      \ 'z': $GHQ_ROOT,
      \ '.': '.',
      \ '': '~',
      \ })

let g:keymapsDL#cmd_after#split_dict = {
      \ '<a-v>': 'vsplit',
      \ '<a-s>': 'split',
      \ '<a-j>': 'bot sp',
      \ '<a-l>': 'bot vs',
      \ '<a-t>': 'tabe',
      \ '<a-e>': 'edit',
      \ }

