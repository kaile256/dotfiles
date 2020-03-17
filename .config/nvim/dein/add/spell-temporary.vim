" From: myplug.toml
" Repo: $DEIN_PRIVATE_HOME/vim-spell-temporary

" let g:spellTMP#without_autoselect_in_normal = 1

imap <c-x>s     <c-g>u<Plug>(spellTMP-suggestion)
imap <c-x><c-s> <c-g>u<Plug>(spellTMP-suggestion)
nmap gs         <Plug>(spellTMP-suggestion)
xmap gs         <Plug>(spellTMP-suggestion)
