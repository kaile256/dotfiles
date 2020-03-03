" From: init.vim

noremap! <expr> ? (getline('.')[col('.') - 2] ==# '~') ? '/' : '?'

inoreabbr donw down
inoreabbr markdonw markdown

inoreabbr endfi endif
" For gitcommit
inoreabbr VInt Vint
