" From: myplug.toml
" Repo: kaile256/vim-keymaps-dealer
" Another: source/keymaps-dealer.vim

call keymapsDL#cmd_after#cd_split('<space>t', 'te fish', '')

" add/fzf.vim
call keymapsDL#cmd_after#cd('<space>z', 'Fzf', '')
call keymapsDL#cmd_after#cd('<space>r', 'Rg',  '')
call keymapsDL#cmd_after#cd(['n', '<space>a'], 'Ag',  '')
