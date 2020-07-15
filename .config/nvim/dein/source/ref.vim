" From: default.toml
" Repo: thinca/vim-ref

let g:ref_no_default_key_mappings = 1

augroup myRefSource
  au FileType * if &keywordprg ==# 'Man' |
        \   nmap <silent><buffer> gK <Plug>(ref-keyword)
        \ | xmap <silent><buffer> gK <Plug>(ref-keyword)
        \ | endif
augroup END
