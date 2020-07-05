" TOML: default.toml
" Repo: tpope/vim-speeddating
" Another: source/speeddating.vim

" nmap g<C-a> <Plug>SpeedDatingUp
" nmap g<C-x> <Plug>SpeedDatingDown

xmap <C-a> <Plug>SpeedDatingUp
xmap <C-x> <Plug>SpeedDatingDown

nmap d<C-a> <Plug>SpeedDatingNowUTC
nmap d<C-x> <Plug>SpeedDatingNowLocal

nmap g<C-a> <Plug>(switch-or-dating)
nmap g<C-x> <Plug>(switch-or-dating-reverse)
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

let g:speeddating_no_mappings = 1

nnoremap <Plug>SpeedDatingFallbackUp   g<C-a>
nnoremap <Plug>SpeedDatingFallbackDown g<C-x>
xnoremap <Plug>SpeedDatingFallbackUp   <C-a>
xnoremap <Plug>SpeedDatingFallbackDown <C-x>
