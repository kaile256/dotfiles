" From: myplug.toml
" Repo: kaile256/vim-spell-suggestion

let g:spellSG#only_suggestion_at_first_in_normal = 1

imap <c-x>s     <Plug>(spellSG-suggestion)
imap <c-x><c-s> <Plug>(spellSG-suggestion)
nmap gs         <Plug>(spellSG-suggestion)
xmap gs         <Plug>(spellSG-suggestion)
