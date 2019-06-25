"" dein.vim manages dein.vim itself, too.

if &compatible
  set nocompatible
endif

filetype off

let s:dein_cache_dir = '~/.cache/nvim/dein'
let s:dein_itself = s:dein_cache_dir . '/repos/github.com/Shougo/dein.vim'

"" The Path, dein.vim is installed.
set rtp+=~/.cache/nvim/dein/repos/github.com/Shougo/dein.vim

if dein#load_state(s:dein_cache_dir)
  call dein#begin(s:dein_cache_dir)

  " list of plugins in toml, which dein manages.
  let s:dein_toml_dir = '~/.config/nvim/dein.d'

  let s:dein_toml = s:dein_toml_dir . '/dein.toml'
  let s:dein_VimEnter_toml= s:dein_toml_dir . '/VimEnter.toml'
  let s:dein_FileType_toml= s:dein_toml_dir . '/FileType.toml'

  " cache the plugin repositorys, listed in toml.
  call dein#load_toml(s:dein_toml,      {'lazy': 0})
  call dein#load_toml(s:dein_VimEnter_toml, {'lazy': 1})
  call dein#load_toml(s:dein_FileType_toml, {'lazy': 1})
  
  call dein#end()
  call dein#save_state()
endif

" Install the plugins, not yet installed, though listed in toml.
if dein#check_install()
  call dein#install()
endif

filetype plugin indent on
syntax enable  " on は設定を無視して構文ハイライトする

" managed plugins options should be loaded after dein activates
runtime! vimrc.d/*.vimrc
