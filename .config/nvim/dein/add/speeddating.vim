" TOML: default.toml
" Repo: tpope/vim-speeddating
" Another: source/speeddating.vim

" nmap d<C-a> <Plug>SpeedDatingNowUTC
" nmap d<C-x> <Plug>SpeedDatingNowLocal

let g:speeddating_no_mappings = 1

" Note: mappings of Fallback could be different between nmap and xmap.
xnoremap <Plug>SpeedDatingFallbackUp   <C-a>
xnoremap <Plug>SpeedDatingFallbackDown <C-x>
xmap <C-a> <Plug>SpeedDatingUp
xmap <C-x> <Plug>SpeedDatingDown

nnoremap <Plug>SpeedDatingFallbackUp   <C-a>
nnoremap <Plug>SpeedDatingFallbackDown <C-x>
nmap <C-a> <Plug>(switch-or-dating)
nmap <C-x> <Plug>(switch-or-dating-reverse)

nmap <silent> <Plug>(switch-or-dating)
      \ :<C-u>silent! if !switch#Switch()
      \ <bar> silent! call speeddating#increment(v:count1)
      \ <bar> endif
      \ <bar> silent! call repeat#set("\<lt>Plug>(switch-or-dating)")<CR>
nmap <silent> <Plug>(switch-or-dating-reverse)
      \ :<C-u>silent! if !switch#Switch({'reverse': 1})
      \ <bar> silent! call speeddating#increment(- v:count1)
      \ <bar> endif
      \ <bar> silent! call repeat#set("\<lt>Plug>(switch-or-dating-reverse)")<CR>
