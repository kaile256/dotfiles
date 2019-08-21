"""" From: init.vim
"""" main plugin-manager is Shougo/dein.vim
"" dein.vim manages dein.vim itself, too.

if !has('nvim')
  "" Neovim is always nocompatible, removed from neovim alread.
  if &compatible
    set nocompatible
  endif
endif

" dein#load_state includes 'set filetype off';
" so 'set filetype on' after load dein & plugins.

let s:dein_cache_dir = g:xdg_cache_home . '/dein'
" Prepared For Reinstall
let g:Shougo_cache_dir = s:dein_cache_dir . '/repos/github.com/Shougo/'
let g:dein_itself = g:Shougo_cache_dir . 'dein.vim/'

set rtp+=~/.cache/dein/repos/github.com/Shougo/dein.vim
"" For plugins' configs
set rtp+=~/.config/nvim/config.d/plugin.d

if ! isdirectory(g:dein_itself)
  "call termopen('mkdir -p' "= 'expand(g:Shougo_cache_dir)' p)
  "call termopen('git clone https://github.com/Shougo/dein.vim' "= 'expand(g:dein_itself)' p)
  exe "!mkdir -p" shellescape(expand(g:Shougo_cache_dir))
  exe "!git clone https://github.com/Shougo/dein.vim" shellescape(expand(g:dein_itself)) | cw
endif

if dein#load_state(s:dein_cache_dir)
  call dein#begin(s:dein_cache_dir)

  " list of plugins in toml, which dein manages.
  let s:dein_toml_dir  = '~/.config/nvim/config.d/toml.d/'

  let s:dein_toml      = s:dein_toml_dir . 'Init.toml'
  let s:appearance_toml= s:dein_toml_dir . 'appearance.toml'
  let s:external_toml  = s:dein_toml_dir . 'external.toml'
  let s:filetype_toml  = s:dein_toml_dir . 'filetype.toml'
  let s:tool_toml      = s:dein_toml_dir . 'tool.toml'

  "" cache the plugin repositorys, listed in toml.
  call dein#load_toml(s:dein_toml,       {'lazy': 0})

  """ Lazy Load
  call dein#load_toml(s:filetype_toml,   {'lazy': 1})
  call dein#load_toml(s:appearance_toml, {'lazy': 1})
  call dein#load_toml(s:tool_toml,       {'lazy': 1})
  call dein#load_toml(s:extra_toml,      {'lazy': 1})

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


"""" SOURCE
""" CAUTION: some plugins MUST be sourced after dein#end() on dein.vim.
"" Ref: Init.toml

""" Colorscheme
if has('nvim')
  runtime gruvbox.vimrc
endif

filetype plugin indent on
"" Highlight as configs which is written on runtimepath
"" \ so `syntax on/enable` should be written after all the plugins loaded.
syntax enable

"""" KEYMAP
""" CAUTION: for the other plugins, DON'T define 'cmap' carelessly.
" install plugins
noremap  <a-d><a-i> :<c-u>call dein#install()<cr>
noremap  <a-d>i     :<c-u>call dein#install()<cr>

" update plugins
noremap <a-d><a-u>  :<c-u>call dein#update()<cr>
noremap <a-d>u      :<c-u>call dein#update()<cr>
