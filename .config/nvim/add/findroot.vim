" From: tool.toml
" Repo: mattn/vim-findroot

" Mnemonic: find Project-root
call extend(g:keymapsDL_cd_path_dict, {
      \ 'p': ':<c-u>FindRoot',
      \ })
