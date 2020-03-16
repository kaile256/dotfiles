" From: default.toml
" Repo: thinca/vim-ref

" map to K in plugin/ will be done with `silent!` and `<unique>`
"let g:ref_no_default_key_mappings = 1

augroup myRefSou
  au!
  au FileType * if &keywordprg ==# 'Man' |
        \   nmap <silent><buffer> gK <Plug>(ref-keyword)
        \ | xmap <silent><buffer> gK <Plug>(ref-keyword)
        \ | endif
augroup END
