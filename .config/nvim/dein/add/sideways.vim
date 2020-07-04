" TOML: operator.toml
" Repo: AndrewRadev/sideways.vim
" Another: source/sideways.vim

" let g:sideways_search_timeout = 0
" let g:sideways_skip_strings_and_comments = 0

nnoremap <silent> - :<C-u>SidewaysLeft<CR>
nnoremap <silent> + :<C-u>SidewaysRight<CR>

omap a, <Plug>SidewaysArgumentTextobjA
xmap a, <Plug>SidewaysArgumentTextobjA
omap i, <Plug>SidewaysArgumentTextobjI
xmap i, <Plug>SidewaysArgumentTextobjI

" let g:sideways_definitions = []
" let b:sideways_definitions = []
" let b:sideways_skip_syntax = []
