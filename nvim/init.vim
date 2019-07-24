"" XDG
let g:xdg_cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let g:xdg_config_home = empty($XDG_CONFIG_HOME) ? expand('~/.config') : $XDG_CONFIG_HOME
let g:xdg_data_home = empty($XDG_DATA_HOME) ? expand('~/.local/share') : $XDG_DATA_HOME

" write in *.vimrc for the config dependent on plugins.
runtime! config.d/*.vim
runtime! config.d/vimap.d/*.vimap

"" Backup
" Write, on path,vim, the file directory paths.
set nobackup
set nowritebackup
set noswapfile

"" Visual Mode
" visualize even if there is no chars.
set virtualedit=block

"" Commandline Mode
set noshowcmd
" activate completion on command-line
set wildmenu
set wildmode=list:longest
"set history=10000
"set wildoptions=pum
"set pumblend=20
