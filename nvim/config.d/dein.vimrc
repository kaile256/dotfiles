"""" main plugin-manager is Shougo/dein.vim
"" dein.vim manages dein.vim itself, too.

if &compatible
  set nocompatible
endif

"" The Path, dein.vim is installed.
let s:dein_cache_dir = '~/.cache/nvim/dein'
let s:dein_itself= s:dein_cache_dir . '/dein/repos/github.com/Shougo/dein.vim'
set rtp+=~/.cache/nvim/dein/repos/github.com/Shougo/dein.vim

"if ! isdirectory(s:dein_itself)
"endif

" dein#load_state includes 'set filetype off';
" so 'set filetype on' after load dein & plugins.
if dein#load_state(s:dein_cache_dir)
  call dein#begin(s:dein_cache_dir)

  " list of plugins in toml, which dein manages.
  let s:dein_toml_dir     = '~/.config/nvim/config.d/toml.d'

  let s:dein_toml         = s:dein_toml_dir . '/Prime.toml'
  let s:dein_VimEnter_toml= s:dein_toml_dir . '/lazy.toml'
  let s:dein_FileType_toml= s:dein_toml_dir . '/filetype.toml'

  " cache the plugin repositorys, listed in toml.
  call dein#load_toml(s:dein_toml,          {'lazy': 0})
  call dein#load_toml(s:dein_VimEnter_toml, {'lazy': 1})
  call dein#load_toml(s:dein_FileType_toml, {'lazy': 1})
  
  " make compatible on vim
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  call dein#end()
  call dein#save_state()
endif

" Install the plugins, not yet installed, though listed in toml.
if dein#check_install()
  call dein#install()
endif

filetype plugin indent on
syntax enable  " on は設定を無視して構文ハイライトする
