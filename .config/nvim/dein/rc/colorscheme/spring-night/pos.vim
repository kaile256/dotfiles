" TOML: colorscheme.toml
" Repo: flazz/vim-colorschemes/colors/spring-night.vim
" Repo: rhysd/vim-color-spring-night
" Another: source/spring-night.vim

hi! link NvimInternalError Error

hi! Quote ctermfg=250 guifg=#bcbcbc
hi! Visual ctermbg=58 guibg=#89893e
hi! Folded ctermfg=189 ctermbg=235 guifg=#e7d5ff guibg=#3a4b5c

hi! Search term=NONE guifg=NONE ctermfg=NONE guibg=#da43da ctermbg=60 gui=underline,bold cterm=underline,bold

" TSCurrentScope: used with nvim-treesitter-refactor's highlight_current_scope
hi! TSCurrentScope guibg=#022631
