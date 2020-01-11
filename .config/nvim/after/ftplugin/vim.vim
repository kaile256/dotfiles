" From: ftplugin.vim

inoremap <buffer><expr> a
      \ (getline('.') =~# 'function!\&.*(.*)\(.*abort\)\@!')
      \ && (getline('.')[col('.') - 2] ==# ' ')
      \ ? 'abort'
      \ : 'a'
