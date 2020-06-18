" TOML: motion.toml
" Repo: svermeulen/vim-extended-ft

nmap <silent> ; <Plug>ExtendedFtRepeatSearchForward
nmap <silent> , <Plug>ExtendedFtRepeatSearchBackward
nmap <silent> f <Plug>ExtendedFtSearchFForward
nmap <silent> F <Plug>ExtendedFtSearchFBackward
nmap <silent> t <Plug>ExtendedFtSearchTForward
nmap <silent> T <Plug>ExtendedFtSearchTBackward

xmap <silent> ; <Plug>ExtendedFtVisualModeRepeatSearchForward
xmap <silent> , <Plug>ExtendedFtVisualModeRepeatSearchBackward
xmap <silent> f <Plug>ExtendedFtVisualModeSearchFForward
xmap <silent> F <Plug>ExtendedFtVisualModeSearchFBackward
xmap <silent> t <Plug>ExtendedFtVisualModeSearchTForward
xmap <silent> T <Plug>ExtendedFtVisualModeSearchTBackward

omap <silent> ; <Plug>ExtendedFtOperationModeRepeatSearchForward
omap <silent> , <Plug>ExtendedFtOperationModeRepeatSearchBackward
omap <silent> f <Plug>ExtendedFtOperationModeSearchFForward
omap <silent> F <Plug>ExtendedFtOperationModeSearchFBackward
omap <silent> t <Plug>ExtendedFtOperationModeSearchTForward
omap <silent> T <Plug>ExtendedFtOperationModeSearchTBackward

hi! ExtendedFt ctermfg=magenta guifg=#ed53cd ctermbg=NONE guibg=NONE cterm=bold gui=bold
