" From: init.vim
" Repo: Shougo/dein.vim

" Let; Make git clone shallow {{{
let g:dein#types#git#clone_depth = 1
"}}}
" Let; Path to the directory of dein's log {{{
let s:dein_data_dir = g:data_home . '/dein'
let s:dein_log_file = s:dein_data_dir . '/dein_log.vim'
let g:dein#install_log_filename = s:dein_log_file
"}}}
" Let; Path to the directory of dein's cache {{{
let g:dein_cache_dir = g:cache_home . '/dein'
let s:Shougo_cache_dir = g:dein_cache_dir . '/repos/github.com/Shougo/'
let s:dein_itself = s:Shougo_cache_dir . 'dein.vim/'
"}}}
" Let; Path for :find {{{
let &path = &path . ',' . g:dein_cache_dir . '**'
"}}}
" Let; Path for :runtime {{{
let &rtp  = &rtp  . ',' . s:dein_itself
"}}}

" call p:auto_install() if !has('dein.vim') {{{
if ! isdirectory(s:dein_itself)
  exe '!mkdir -p' shellescape(expand(s:Shougo_cache_dir))
  exe '!git clone https://github.com/Shougo/dein.vim' shellescape(expand(s:dein_itself))
endif
"}}}
" CmdAbbr; Call Dein's Function {{{
cnoreabbr <expr> du (getcmdtype() == ':' && getcmdline() =~ '^du$')? 'call dein#update()' : 'du'
" direct-install      [dein#direct_install] install a plugin directly
cnoreabbr <expr> din (getcmdtype() == ':' && getcmdline() =~ '^di$')? 'Dein direct-install' : 'din'
cnoreabbr <expr> drb (getcmdtype() == ':' && getcmdline() =~ '^drb$')? 'call dein#rollback()' : 'drb'
cnoreabbr <expr> drc (getcmdtype() == ':' && getcmdline() =~ '^drc$')? 'call dein#recache_runtimepath()' : 'drc'

cnoreabbr <expr> dlz (getcmdtype() == ':' && getcmdline() =~ '^dlz$')? 'call dein#check_lazy_plugins()' : 'dlz'

cnoreabbr <expr> dlg (getcmdtype() == ':' && getcmdline() =~ '^dlog$')? 'call dein#get_log' : 'dlg'
" TODO: make `:drm` work w/ s:var.
"cnoreabbr <expr> drm (getcmdtype() == ':' && getcmdline() =~ '^drm$')? 'exe "!rm -rf" shellescape(expand(g:dein_cache_dir))' : 'drm'
cnoreabbr <expr> drm (getcmdtype() == ':' && getcmdline() =~ '^drm$')? '!rm -rf ~/.cache/dein' : 'drm'
"}}}
" set nocompatible for dein {{{
if !has('nvim')
  " Neovim is always nocompatible.
  if &compatible | set nocompatible | endif
endif "}}}
if dein#load_state(g:dein_cache_dir)
  call dein#begin(g:dein_cache_dir)
  "" Duplicated and Deprecated {{{
  "" Path; toml {{{
  "let s:Init_toml      = s:dein_toml_dir . 'Init.toml'
  "let s:appearance_toml= s:dein_toml_dir . 'appearance.toml'
  "let s:filetype_toml  = s:dein_toml_dir . 'filetype.toml'
  "let s:external_toml  = s:dein_toml_dir . 'external.toml'
  "let s:tool_toml  = s:dein_toml_dir . 'tool.toml'
  "let s:insert_toml  = s:dein_toml_dir . 'insert.toml'
  "let s:finder_toml  = s:dein_toml_dir . 'finder.toml'
  "let s:motion_toml  = s:dein_toml_dir . 'motion.toml'
  "let s:memo_toml  = s:dein_toml_dir . 'memo.toml'
  "let s:ftplugin_toml  = s:dein_toml_dir . 'ftplugin.toml'
  "let s:tool_toml      = s:dein_toml_dir . 'tool.toml'
  ""}}}
  "" Call; lazy or not {{{
  "call dein#load_toml(s:Init_toml,       {'lazy': 0})
  "call dein#load_toml(s:filetype_toml,   {'lazy': 0})
  "call dein#load_toml(s:appearance_toml, {'lazy': 1})
  "call dein#load_toml(s:ftplugin_toml,   {'lazy': 1})
  "call dein#load_toml(s:tool_toml,       {'lazy': 1})
  "call dein#load_toml(s:external_toml, {'lazy': 1})
  "call dein#load_toml(s:tool_toml, {'lazy': 1})
  "call dein#load_toml(s:insert_toml, {'lazy': 1})
  "call dein#load_toml(s:finder_toml, {'lazy': 1})
  "call dein#load_toml(s:motion_toml, {'lazy': 1})
  "call dein#load_toml(s:memo_toml, {'lazy': 1})
  ""}}}
  ""}}}
  if !has('nvim') "{{{
    " make compatible on vim
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif "}}}
  let s:dein_toml_dir  = g:config_home . '/nvim/toml'
  let s:dein_toml_initial_list = [
        \ 'Init.toml'
        \ ]
  for dir in s:dein_toml_initial_list
    call dein#load_toml(s:dein_toml_dir . '/' . dir, {'lazy': 0})
  endfor
  let s:dein_toml_lazy_list = [
        \ 'appearance.toml',
        \ 'denite.toml',
        \ 'external.toml',
        \ 'finder.toml',
        \ 'ftplugin.toml',
        \ 'insert.toml',
        \ 'memo.toml',
        \ 'motion.toml',
        \ 'tool.toml',
        \ 'web.toml'
        \ ]
  for dir in s:dein_toml_lazy_list
    call dein#load_toml(s:dein_toml_dir . '/' . dir, {'lazy': 1})
  endfor
  call dein#end()
  call dein#save_state()
endif

if dein#check_install() "{{{
  call dein#install()
endif "}}}
augroup DeinCallPostSource "{{{
  au!
  au VimEnter * call dein#call_hook('post_source')
augroup END "}}}
augroup DeinTomlAutoConf
  au BufRead nvim**.toml if &keywordprg !=# 'help' | setl keywordprg=:help
  au BufWinEnter filetype.toml setl syn=vim
augroup END

filetype plugin indent on
syntax enable
