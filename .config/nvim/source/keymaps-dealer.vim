" From: myplug.toml
" Repo: kaile256/vim-keymaps-dealer
" Another: post/keymaps-dealer.vim

if !exists('g:keymapsDL#cmd_after#cd_path_dict')
  let g:keymapsDL#cmd_after#cd_path_dict = {}
endif
let g:keymapsDL#default_modes = ['nx']

" g:keymapsDL#cmd_after#cd_path_dict is also extended by
"     1. rc/dein.vim
call extend(g:keymapsDL#cmd_after#cd_path_dict, {
      \ 'v': g:nvim_home,
      \ 'l': $XDG_DATA_HOME,
      \ 'f': $XDG_CONFIG_HOME,
      \ 'd': g:dotfiles_home,
      \ 'z': $GHQ_ROOT,
      \ 'r': $VIMRUNTIME,
      \ 'h': '~',
      \ 'w': '%:p:h',
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

