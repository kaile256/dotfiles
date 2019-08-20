""" Encoding
set encoding=utf-8
scriptencoding utf-8

"" XDG
let g:xdg_cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let g:xdg_config_home = empty($XDG_CONFIG_HOME) ? expand('~/.config') : $XDG_CONFIG_HOME
let g:xdg_data_home = empty($XDG_DATA_HOME) ? expand('~/.local/share') : $XDG_DATA_HOME

" WARNING: `!` is Required to source all the files.
runtime! config.d/*.vim
"runtime plugged.vimrc
runtime dein.vimrc

""" Buffer
nnoremap <buffer> <F12> :mapclear <cr>
