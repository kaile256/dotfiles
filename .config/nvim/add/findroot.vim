" From: tool.toml
" Repo: mattn/vim-findroot

" Mnemonic: find Project-root
call extend(g:keymapsDL#cmd_after#cd_path_dict, {
      \ 'p': ':<c-u>FindRoot',
      \ })
