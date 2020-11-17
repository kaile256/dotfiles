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
" nmap <C-a> <Plug>(switch-or-dating)
" nmap <C-x> <Plug>(switch-or-dating-reverse)
"
" function! s:increment() abort
"   let cnt = v:count1
"   silent! call repeat#set("\<Plug>(switch-or-dating)")
"   let save_line = getline('.')
"
"   let is_switched = switch#Switch()
"   if is_switched | return | endif
"   call speeddating#increment(cnt)
"
"   if  getline('.') !=# save_line | return | endif
"   exe "norm \<Plug>(symbolicInc-increment-sync)"
" endfunction
"
" function! s:decrement() abort
"   let cnt = v:count1
"   silent! call repeat#set("\<Plug>(switch-or-dating-reverse)")
"   let save_line = getline('.')
"
"   let is_switched = switch#Switch({'reverse': 1})
"   if is_switched | return | endif
"   call speeddating#increment(- cnt)
"
"   if getline('.') !=# save_line | return | endif
"   exe "norm \<Plug>(symbolicInc-decrement-sync)"
" endfunction
"
" nmap <silent> <Plug>(switch-or-dating)         :<C-u>call <SID>increment()<CR>
" nmap <silent> <Plug>(switch-or-dating-reverse) :<C-u>call <SID>decrement()<CR>
