" From: 'tool.toml'

" 0 - Errors only
" 1 - Quiet message
" 2 - Loud message (may log multiple messages at once, making the screen
"     shift momentarily)
" 3 - Debug information (all messages).
let g:neomake_verbose = 0
let g:neomake_logfile = '~/.tmp/neoterm.sh'
