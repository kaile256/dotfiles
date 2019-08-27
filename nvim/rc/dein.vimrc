" From: init.vim
"  Ref: Init.toml
"  Def: Shougo/dein.vim
" dein.vim manages dein.vim itself, too.


" Abbr; Update Plugins
cnoreabbrev <expr> du (getcmdtype() == ':' && getcmdline() =~ '^du$')? 'call dein#update()' : 'du'

augroup DeinAutoRecache "{{{
  au!
  au TextChanged dein.vimrc,nvim/toml/*.toml au BufWinLeave nvim/toml/*.toml call dein#recache_runtimepath()
augroup END "}}}
augroup DeinCallPostSource "{{{
  au!
	au VimEnter * call dein#call_hook('post_source')
augroup END "}}}


if !has('nvim')
  " Neovim is always nocompatible.
  if &compatible | set nocompatible | endif
endif

" dein#load_state includes `set filetype off`;
" so `set filetype on` after load dein & plugins.
"
" Git; shallow depth
let g:dein#types#git#clone_depth = 1

" Where; Log File {{{
let s:dein_data_dir = g:data_home . '/dein'
let s:dein_log_file = s:dein_data_dir . '/dein_log.vim'
let g:dein#install_log_filename = s:dein_log_file
"}}}
" Where; Dein will install plugins {{{
let s:dein_cache_dir = g:cache_home . '/dein'
let s:Shougo_cache_dir = s:dein_cache_dir . '/repos/github.com/Shougo/'
let s:dein_itself = s:Shougo_cache_dir . 'dein.vim/'
"}}}

" list of plugins in toml, which dein manages.
let s:dein_toml_dir  = '~/.config/nvim/toml/'

" Path; for :find
let &path = &path . ',' . s:dein_cache_dir . '**'
" Path; for :runtime
let &rtp  = &rtp  . ',' . s:dein_itself

" Auto Install if no dein.vim {{{
if ! isdirectory(s:dein_itself)
  "call termopen('mkdir -p' "= 'expand(s:Shougo_cache_dir)')
  "call termopen('git clone https://github.com/Shougo/dein.vim' "= 'expand(s:dein_itself)')
  exe '!mkdir -p' shellescape(expand(s:Shougo_cache_dir))
  exe '!git clone https://github.com/Shougo/dein.vim' shellescape(expand(s:dein_itself))
  if ! isdirectory('~/.tmp')
    exe '!mkdir -p $HOME/.tmp'
  endif
  e ~/.tmp/messages.vim
  put =execute('messages')
endif
"}}}

" Where; Dein Sources {{{
if dein#load_state(s:dein_cache_dir)
  call dein#begin(s:dein_cache_dir)

  let s:dein_toml      = s:dein_toml_dir . 'Init.toml'
  let s:appearance_toml= s:dein_toml_dir . 'appearance.toml'
  let s:external_toml  = s:dein_toml_dir . 'external.toml'
  let s:filetype_toml  = s:dein_toml_dir . 'filetype.toml'
  let s:tool_toml      = s:dein_toml_dir . 'tool.toml'

  "" cache the plugin repositorys, listed in toml.
  call dein#load_toml(s:dein_toml,       {'lazy': 0})

  """  Lazy Load
  call dein#load_toml(s:appearance_toml, {'lazy': 1})
  call dein#load_toml(s:filetype_toml,   {'lazy': 1})
  call dein#load_toml(s:tool_toml,       {'lazy': 1})
  call dein#load_toml(s:external_toml,   {'lazy': 1})

  " make compatible on vim
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  call dein#end()
  call dein#save_state()
endif
"}}}

if dein#check_install() "{{{
  call dein#install()
  e ~/.tmp/messages.vim
  put =execute('messages')
endif "}}}

" Highlight as configs which is written on runtimepath
"  so that `syntax on/enable` should be written after all the plugins loaded.
filetype plugin indent on
syntax enable
