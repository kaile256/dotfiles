let s:dein_cache_dir = '~/.cache/nvim/dein'
let s:dein_itself= s:dein_cache_dir . '/dein/repos/github.com/Shougo/dein.vim'
let g:init_dit = '~/.config/nvim/init.d'

if ! isdirectory(s:dein_itself)
  !cd ~/.cache/bash/nvim && ./dein_install.sh
endif
