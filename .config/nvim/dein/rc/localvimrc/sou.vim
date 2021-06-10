" TOML: vimscript.toml
" Repo: embear/vim-localvimrc

let g:localvimrc_name = [
      \ '.local.vimrc',
      \ ]

let g:localvimrc_ask = 1 " 1: Ask berfore sourcing any local vimrcs.
let g:localvimrc_persistent = 2 " 2: Store/restore all decisions.
let g:localvimrc_persistence_file = expand('$XDG_CACHE_HOME/localvimrc')
let g:localvimrc_python2_enable = 0
