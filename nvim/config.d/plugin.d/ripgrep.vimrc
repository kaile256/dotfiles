"""" From: leap.toml
"""" Help: https://github.com/jremmen/vim-ripgrep

let g:rg_window_location = topleft
" true: highlight matched-word.
let g:rg_highlight = true
" true: fitde project root from cwd.
let g:rg_derive_root = true

"""" KEYMAP
nmap <a-r> :Rg 
