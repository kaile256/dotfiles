""" Encoding
set encoding=utf-8
scriptencoding utf-8

"" XDG
let g:xdg_cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let g:xdg_config_home = empty($XDG_CONFIG_HOME) ? expand('~/.config') : $XDG_CONFIG_HOME
let g:xdg_data_home = empty($XDG_DATA_HOME) ? expand('~/.local/share') : $XDG_DATA_HOME

"runtime plugged.vimrc
" WARNING: `!` is Required to source all the files.
"runtime leap.vim
"runtime buffer.vim
runtime! config.d/*.vim
runtime dein.vimrc

""" Buffer
nnoremap <buffer> <S-F12> :mapclear <cr>
