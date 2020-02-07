" From: myplug.toml
" Repo: kaile256/vim-SandJoin

let g:SandJoin#no_default_mappings = 1

if mapcheck('J', 'n') !=# ''
  " Mnemonic: <space>-leaving Join
  nmap <space>J <Plug>(SandJoin-J)
else
  nmap J <Plug>(SandJoin-J)
endif

if mapcheck('J', 'x') !=# ''
  xmap <space>J <Plug>(SandJoin-J)
else
  xmap J <Plug>(SandJoin-J)
endif

nmap gJ <Plug>(SandJoin-gJ)
xmap gJ <Plug>(SandJoin-gJ)
