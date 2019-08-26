" From: init.vim
"  Ref: Init.toml
"  Def: Shougo/dein.vim
" dein.vim manages dein.vim itself, too.

augroup DeinAutoRecache "{{{
  au!

  au TextChanged toml.d/*.toml au BufWinLeave toml.d/*.toml call dein#recache_runtimepath()
  "" Enable 'dein's auto-recache' only on once-written buffers. {{{
  "au BufWinEnter *.toml,dein.vimrc let b:dein_is_written = 0

  "function! s:dein_toggle_auto_recache() "{{{
  "  if !exists(b:dein_is_written)
  "    let b:dein_is_written = 1
  "    let g:dein#auto_recache = 1
  "  else
  "    let b:dein_is_written = 0
  "    let g:dein#auto_recache = 0
  "  endif
  "endfunction "}}}

  "au BufWritePre *.toml,dein.vimrc au BufWinLeave *.toml,dein.vimrc call <SID>dein_toggle_auto_recache()
  "}}}
augroup END "}}}

if !has('nvim')
  "" Neovim is always nocompatible, removed from neovim alread.
  if &compatible
    set nocompatible
  endif
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
let g:Shougo_cache_dir = s:dein_cache_dir . '/repos/github.com/Shougo/'
let g:dein_itself = g:Shougo_cache_dir . 'dein.vim/'
"}}}

" list of plugins in toml, which dein manages.
"let s:dein_toml_dir  = '~/.config/nvim/config.d/toml.d/'
let s:dein_toml_dir  = '~/.config/nvim/toml/'

set rtp+=~/.cache/dein/repos/github.com/Shougo/dein.vim
"" For plugins' configs
"set rtp+=~/.config/nvim/rc

" Auto Install if no dein.vim {{{
if ! isdirectory(g:dein_itself)
  "call termopen('mkdir -p' "= 'expand(g:Shougo_cache_dir)')
  "call termopen('git clone https://github.com/Shougo/dein.vim' "= 'expand(g:dein_itself)')
  exe "!mkdir -p" shellescape(expand(g:Shougo_cache_dir))
  exe "!git clone https://github.com/Shougo/dein.vim" shellescape(expand(g:dein_itself))
  if ! isdirectory('~/.tmp')
    exe "!mkdir -p $HOME"
  endif
  e ~/.tmp/messages_=execute('localtime()')<cr>.vim
  put =execute('messages')
endif
"}}}

" Dein Where to Source {{{
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

" Install the plugins, not yet installed, though listed in toml.

if dein#check_install()
  call dein#install()
  e ~/.tmp/messages=execute('localtime()').vim
  put =execute('messages')
endif

" SOURCE
" CAUTION: some plugins MUST be sourced after dein#end() on dein.vim.

" Highlight as configs which is written on runtimepath
"  so that `syntax on/enable` should be written after all the plugins loaded.
filetype plugin indent on
syntax enable

" KEYMAP
" CAUTION: for the other plugins, DON'T define 'cmap' carelessly.
" install plugins
noremap  <a-d><a-i> :<c-u>call dein#install()<cr>
noremap  <a-d>i     :<c-u>call dein#install()<cr>

" update plugins
cnoreabbrev <expr> du (getcmdtype() == ':' && getcmdline() =~ '^du$')? 'call dein#update()' : 'du'
