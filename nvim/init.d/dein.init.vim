"" Auto-Install: dein
let s:dein_cache_dir = g:xdg_cache_home . '/dein'
let s:dein_itself= s:dein_cache_dir . '/repos/github.com/Shougo/dein.vim'
if ! isdirectory(s:dein_itself)
  call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_itself))
endif
