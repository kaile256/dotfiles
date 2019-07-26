"""" main plugin-manager is Shougo/dein.vim
"" dein.vim manages dein.vim itself, too.

if &compatible
  set nocompatible
endif

"" The Path, dein.vim is installed.

"if ! isdirectory(s:dein_itself)
"endif

" dein#load_state includes 'set filetype off';
" so 'set filetype on' after load dein & plugins.

let s:dein_cache_dir = g:xdg_cache_home . '/nvim/dein'
let s:dein_itself= s:dein_cache_dir . '/repos/github.com/Shougo/dein.vim/'

set rtp+=~/.cache/nvim/dein/repos/github.com/Shougo/dein.vim

if ! exists('expand("s:dein_itself")')
  echo "                Install dein!"
else
  if dein#load_state(s:dein_cache_dir)
    call dein#begin(s:dein_cache_dir)

    " list of plugins in toml, which dein manages.
    let s:dein_toml_dir     = '~/.config/nvim/config.d/toml.d/'

    let s:dein_toml      = s:dein_toml_dir . 'Initial.toml'
    let s:appearance_toml= s:dein_toml_dir . 'appearance.toml'
    let s:filetype_toml  = s:dein_toml_dir . 'filetype.toml'
    let s:tool_toml      = s:dein_toml_dir . 'tool.toml'
    let s:leap_toml      = s:dein_toml_dir . 'leap.toml'
    let s:extra_toml     = s:dein_toml_dir . 'extra.toml'

    " cache the plugin repositorys, listed in toml.
    call dein#load_toml(s:dein_toml,       {'lazy': 0})

    "" Lazy Load
    call dein#load_toml(s:appearance_toml, {'lazy': 1})
    call dein#load_toml(s:filetype_toml,   {'lazy': 1})
    call dein#load_toml(s:tool_toml,       {'lazy': 1})
    call dein#load_toml(s:leap_toml,       {'lazy': 1})
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

  filetype plugin indent on
  syntax enable  " on は設定を無視して構文ハイライトする

  """" KEYMAP
  " install plugins
  noremap  <a-d><a-i> :<c-u>call dein#install()<cr>
  noremap  <a-d>i     :<c-u>call dein#install()<cr>
  cnoremap <a-d><a-i> :<c-u>call dein#install()<cr>
  cnoremap <a-d>i     :<c-u>call dein#install()<cr>

  " update plugins
  noremap <a-d><a-u>  :<c-u>call dein#update()<cr>
  noremap <a-d>u      :<c-u>call dein#update()<cr>
  cnoremap <a-d><a-u> :<c-u>call dein#update()<cr>
  cnoremap <a-d>u     :<c-u>call dein#update()<cr>

endif
