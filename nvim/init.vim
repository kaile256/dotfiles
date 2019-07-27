"" XDG
let g:xdg_cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let g:xdg_config_home = empty($XDG_CONFIG_HOME) ? expand('~/.config') : $XDG_CONFIG_HOME
let g:xdg_data_home = empty($XDG_DATA_HOME) ? expand('~/.local/share') : $XDG_DATA_HOME

runtime! dein.vim
runtime! config.d/*.vim
runtime! config.d/vimap.d/*.vimap

""" Buffer
nnoremap <buffer> <F12> :mapclear <cr>

""" Backup
" Write, on path,vim, the file directory paths.
set nobackup
set nowritebackup
set noswapfile
