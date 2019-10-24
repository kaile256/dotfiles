" From: nvim/init.vim
" Repo: Shougo/dein.vim

" Let; Make git clone shallow {{{
let g:dein#types#git#clone_depth = 1
"}}}
" Let; Path to the directory of dein's log {{{
let s:dein_data_dir = g:data_home . '/dein/'
let s:dein_log_file = s:dein_data_dir . '/dein_log.vim'
let g:dein#install_log_filename = s:dein_log_file
"}}}
" Let; Path to the directory of dein's cache {{{
let g:dein_cache_dir   = g:cache_home       . '/dein/'
let g:dein_github_dir  = g:dein_cache_dir   . '/repos/github.com/'
let s:Shougo_cache_dir = g:dein_cache_dir   . '/repos/github.com/Shougo/'
let s:dein_itself      = s:Shougo_cache_dir . '/dein.vim/'

if !exists('g:kmDealer_cd_path_dict')
  let g:kmDealer_cd_path_dict = {}
endif
call extend(g:kmDealer_cd_path_dict, {
      \ 'c': g:dein_cache_dir,
      \ }
      \ )
"}}}
" Let; Path for :find {{{
"let &path = &path . ',' . g:dein_cache_dir . '**'
"}}}
" Let; Path for :runtime {{{
let &rtp = &rtp .','. s:dein_itself
"}}}

" call p:auto_install() if !has('dein.vim') {{{
if ! isdirectory(s:dein_itself)
  exe '!mkdir -p ' shellescape(expand(s:Shougo_cache_dir))
  exe '!git clone https://github.com/Shougo/dein.vim '. shellescape(expand(s:dein_itself))
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

  let s:dein_toml_lazy_list = [
        \ 'appearance.toml',
        \ 'external.toml',
        \ 'finder.toml',
        \ 'ftplugin.toml',
        \ 'git.toml',
        \ 'insert.toml',
        \ 'japanese.toml',
        \ 'memo.toml',
        \ 'motion.toml',
        \ 'myplug.toml',
        \ 'syntax.toml',
        \ 'textobj.toml',
        \ 'tool.toml',
        \ 'vimscript.toml',
        \ 'web.toml',
        \ ]

if dein#load_state(g:dein_cache_dir) "{{{
  call dein#begin(g:dein_cache_dir)
  if !has('nvim') "{{{
    " make compatible on vim
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif "}}}
  let g:dein_toml_dir  = g:config_home .'/nvim/toml'
  let s:dein_toml_initial_list = [
        \ 'Init.toml'
        \ ]
  for dir in s:dein_toml_initial_list
    call dein#load_toml(g:dein_toml_dir .'/'. dir, {'lazy': 0})
  endfor
  for dir in s:dein_toml_lazy_list
    call dein#load_toml(g:dein_toml_dir .'/'. dir, {'lazy': 1})
  endfor
  call dein#end()
  call dein#save_state()
endif "}}}

if dein#check_install() "{{{
  call dein#install()
endif "}}}

augroup DeinCallMyFunctions "{{{
  au!
  " To: inititialize to source 'hook_post_source'.
  au VimEnter * call dein#call_hook('post_source')
augroup END "}}}
augroup DeinTomlAutoConf "{{{
  au!
  au CursorMoved nvim/**.toml  setl keywordprg=:vert\ help
  au BufWinEnter filetype.toml setl syn=vim
augroup END "}}}

filetype plugin indent on
syntax enable " do after vimwiki append syntax
