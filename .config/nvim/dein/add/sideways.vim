" TOML: operator.toml
" Repo: AndrewRadev/sideways.vim
" Another: source/sideways.vim
" Also: after/ftplugin/

" let g:sideways_search_timeout = 0
" let g:sideways_skip_strings_and_comments = 0

nnoremap <silent> - :<C-u>SidewaysLeft<CR>
nnoremap <silent> + :<C-u>SidewaysRight<CR>

omap <silent> a, <Plug>SidewaysArgumentTextobjA
xmap <silent> a, <Plug>SidewaysArgumentTextobjA
omap <silent> i, <Plug>SidewaysArgumentTextobjI
xmap <silent> i, <Plug>SidewaysArgumentTextobjI

" let g:sideways_definitions = []
" let b:sideways_definitions = []
" let b:sideways_skip_syntax = []
