" From: init.vim
" Repo: Shougo/dein.vim

" Note: you can see the function of dummys commands for lazy load on
"   Shougo/dein.vim/autoload/dein/parse.vim @314

" CmdAbbr; Call Function {{{1
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

" set nocompatible for dein {{{1
if !has('nvim')
  " Neovim is always nocompatible.
  if &compatible | set nocompatible | endif
endif

" Path to the directory for dein's log {{{1
let s:dein_data_dir = $XDG_DATA_HOME .'/dein/'
let s:dein_log_file = s:dein_data_dir .'/dein_log.vim'
let g:dein#install_log_filename = s:dein_log_file

" Path to the directory for dein's cache {{{1
let g:dein_cache_dir   = $XDG_CACHE_HOME    .'/dein/'
let g:dein_github_dir  = g:dein_cache_dir   .'/repos/github.com/'
let s:Shougo_cache_dir = g:dein_cache_dir   .'/repos/github.com/Shougo/'
let s:dein_itself      = s:Shougo_cache_dir .'/dein.vim/'

" call p:auto_install() if !has('dein.vim') {{{2
if !isdirectory(s:dein_itself)
  exe '!mkdir -p' shellescape(expand(s:Shougo_cache_dir))
  exe '!git clone https://github.com/Shougo/dein.vim' shellescape(expand(s:dein_itself))
endif

" Path for :find {{{1
"let &path = &path . ',' . g:dein_cache_dir . '**'

" Path for :runtime {{{1
"let &rtp .= ','. s:dein_itself
exe 'set rtp +='. s:dein_itself

" Make git clone shallow {{{1
let g:dein#types#git#clone_depth = 1
let g:dein#types#git#default_protocol = 'ssh'

let g:dein#install_progress_type      = 'tabline'
if has('unix')
  let g:dein#enable_notification = 1
endif

" List of TOML {{{1
" Note: path could be different on the files managed in dotfiles
"   if g:dein_toml_dir's includes $XDG_CONFIG_HOME
let g:dein_toml_dir = '/nvim/toml/'
let s:dein_toml_dir = $XDG_CONFIG_HOME . g:dein_toml_dir

"let g:dein#types#git#pull_command = 'pull --ff --ff-only'
" Note: if bugs after installation, like no command ':Ag' or ':Gush' on
"       vim-fugitive, doubt if you really quitted vim by vim itself, i.e., had
"       not quitted by i3wm.
let s:toml_startup = [
      \ 'startup.toml'
      \ ]

let s:toml_pc_only = [
      \ 'web.toml',
      \ ]

let s:toml_lazy = [
      \ 'appearance.toml',
      \ 'debug.toml',
      \ 'default.toml',
      \ 'easymotion.toml',
      \ 'ext.toml',
      \ 'external.toml',
      \ 'browse.toml',
      \ 'fold.toml',
      \ 'ftplugin.toml',
      \ 'fugitive.toml',
      \ 'git.toml',
      \ 'insert.toml',
      \ 'japanese.toml',
      \ 'markdown.toml',
      \ 'memo.toml',
      \ 'motion.toml',
      \ 'myplug.toml',
      \ 'shell.toml',
      \ 'syntax.toml',
      \ 'textobj.toml',
      \ 'vimscript.toml',
      \ ]

" Load Plugins by Dein {{{1
if !exists('g:plugins_available')
  if dein#load_state(g:dein_cache_dir)
    call dein#begin(g:dein_cache_dir)

    if !has('nvim') " but only for vim {{{2
      " make compatible on vim
      call dein#add('roxma/nvim-yarp')
      call dein#add('roxma/vim-hug-neovim-rpc')
    endif

    " load toml {{{2
    "" using globpath() {{{3
    "" Note: too slow to startup vim, using globpath() by 1 or 2 seconds
    "let s:globpath      = {arg -> split(globpath(s:dein_toml_dir, arg))}
    "let s:toml_startup  = s:globpath('startup/*.toml')
    "let s:toml_lazy     = s:globpath('*.toml')
    "let s:toml_pc_only  = s:globpath('pc_only/*.toml')

    "for dir in s:toml_startup
    "  call dein#load_toml(dir, {'lazy': 0})
    "endfor
    "for dir in s:toml_lazy
    "  call dein#load_toml(dir, {'lazy': 1})
    "endfor
    "for dir in s:toml_pc_only
    "  call dein#load_toml(dir, {'lazy': 1,
    "        \ 'if': "system('uname -o') !~# 'Android'",
    "        \ })
    "endfor

    " using a wrapper function {{{3
    let s:load_toml = {path, opt -> dein#load_toml(
          \ s:dein_toml_dir .'/'. path, opt
          \ )}
    for path in s:toml_startup
      call s:load_toml(path, {'lazy': 0})
    endfor
    for path in s:toml_lazy
      call s:load_toml(path, {'lazy': 1})
    endfor
    if executable('xinput')
      for path in s:toml_pc_only
        call s:load_toml(path, {'lazy': 1})
      endfor
    endif

    "" raw {{{3
    "let s:load_toml = {path, opt -> dein#load_toml(
    "      \ s:dein_toml_dir .'/'. path, opt
    "      \ )}
    "for path in s:toml_startup
    "  call dein#load_toml(s:dein_toml_dir .'/startup/'. path, {'lazy': 0})
    "endfor
    "for path in s:toml_lazy
    "  call dein#load_toml(s:dein_toml_dir .'/'. path, {'lazy': 1})
    "endfor
    "for path in s:toml_pc_only
    "  call dein#load_toml(s:dein_toml_dir .'/pc_only/'. path, {
    "        \ 'lazy': 1,
    "        \ 'if': "system('uname -o') !~# 'Android'",
    "        \ })
    "endfor
    ""}}}2

    call dein#end()
    call dein#save_state()
  endif

  if dein#check_install() "{{{2
    call dein#install()
  endif "}}}2

  filetype plugin indent on
  let g:plugins_available = 1
endif

augroup DeinCallMyFunctions "{{{1
  au!
  " To: inititialize to source 'hook_post_source'.
  "au VimEnter * call dein#call_hook('post_source')
augroup END

augroup DeinTomlAutoConf "{{{1
  au!
  au BufEnter *vim**/*.toml setl keywordprg=:help
  " Note: keep it unused; unreloadable by `:source`
  "au BufWinEnter filetype.toml setl syn=vim
augroup END

" unlet {{{1
""unlet s:dein_toml_dir
"unlet s:dein_itself
"unlet s:dein_log_file
"unlet s:dein_data_dir
"unlet s:dein_toml_lazy
"unlet s:dein_toml_initial
"
