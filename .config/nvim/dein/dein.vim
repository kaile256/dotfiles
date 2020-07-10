" From: init.vim
" Repo: Shougo/dein.vim

" Note: you can see the function of dummys commands for lazy load on
"   Shougo/dein.vim/autoload/dein/parse.vim @314

let $DEIN_CONFIG_HOME = expand('$XDG_CONFIG_HOME/nvim/dein')
let $DEIN_TOML_HOME   = $DEIN_CONFIG_HOME .'/toml'
" For the plugins in local path
let $DEIN_PRIVATE_HOME = $DEIN_CONFIG_HOME .'/.private'

" ':source' should be faster than ':runtime'
let $DEIN_ADD_HOME = $DEIN_CONFIG_HOME .'/add'
let $DEIN_SOURCE_HOME = $DEIN_CONFIG_HOME .'/source'
let $DEIN_POST_HOME = $DEIN_CONFIG_HOME .'/post'

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
let s:dein_data_dir = $XDG_DATA_HOME .'/dein'
let s:dein_log_file = s:dein_data_dir .'/dein_log.vim'
let g:dein#install_log_filename = s:dein_log_file

" Path to the directory for dein's cache {{{1
" Let me '$DEIN_CACHE_HOME' for shell in Vim/Neovim
let $DEIN_CACHE_HOME = $XDG_CACHE_HOME  .'/dein'
let $DEIN_GITHUB_DIR = $DEIN_CACHE_HOME .'/repos/github.com'
let s:Shougo_cache_dir = $DEIN_CACHE_HOME   .'/repos/github.com/Shougo'
let s:dein_itself      = s:Shougo_cache_dir .'/dein.vim'

" call p:auto_install() if !has('dein.vim') {{{2
if !isdirectory(s:dein_itself)
  call mkdir(expand(s:Shougo_cache_dir), 'p')
  exe '!git clone https://github.com/Shougo/dein.vim' shellescape(expand(s:dein_itself))
endif

" Path for :find {{{1
"let &path = &path . ',' . g:dein_cache_dir . '**'

" Runtime Path for Dein {{{1
"let &rtp .= ','. s:dein_itself
exe 'set rtp +='. s:dein_itself
exe 'set rtp +='. $XDG_CONFIG_HOME .'/nvim/dein'

" Make git clone shallow {{{1
let g:dein#types#git#clone_depth = 1
let g:dein#install_progress_type = 'tabline'
if has('unix')
  let g:dein#enable_notification = 1
endif

" the Function to load plugins {{{1
function! s:load_plugins(list) abort
  " both toml and plugin's name are loadable.
  " Note: dict['idx'] is faster than dict.idx
  " map() works slower because it's not so different than additional for-loop.

  " TODO: get plugins' normalized name to map() to override dict like 'hook_add'
  " to 'runtime add/(normalized_name).vim'.
  for dict in a:list
    if get(dict['opt'], 'if', 1) == 0
      continue
    endif

    for fname in dict['fnames']
      if fname =~# '\.toml$'
        " format: dein#load_toml(path, opt)
        call dein#load_toml($DEIN_TOML_HOME .'/'. fname, dict['opt'])
        continue
      endif

      call dein#add(fname, dict['opt'])
    endfor
  endfor
endfunction

" the List of TOML {{{1
" Note: path could be different on the files managed in dotfiles
"   if g:dein_toml_dir's includes $XDG_CONFIG_HOME

"let g:dein#types#git#pull_command = 'pull --ff --ff-only'
" Note: if bugs after installation, like no command ':Ag' or ':Gush' on
"       vim-fugitive, doubt if you really quitted vim by vim itself, i.e., had
"       not quitted by i3wm.

let s:toml_lazy = [
      \ 'appearance.toml',
      \ 'browse.toml',
      \ 'colorscheme.toml',
      \ 'compiler.toml',
      \ 'debug.toml',
      \ 'default.toml',
      \ 'denite.toml',
      \ 'ext.toml',
      \ 'external.toml',
      \ 'fold.toml',
      \ 'ftplugin.toml',
      \ 'fugitive.toml',
      \ 'git.toml',
      \ 'insert.toml',
      \ 'japanese.toml',
      \ 'lsp.toml',
      \ 'markdown.toml',
      \ 'memo.toml',
      \ 'motion.toml',
      \ 'operator.toml',
      \ 'private.toml',
      \ 'public.toml',
      \ 'script.toml',
      \ 'shell.toml',
      \ 'syntax.toml',
      \ 'textobj.toml',
      \ 'vimscript.toml',
      \ 'xampp.toml',
      \ ]

if executable('xinput')
  let s:toml_lazy += [
        \ 'web.toml'
        \ ]
endif

let s:tomls = [{
      \ 'opt': {'lazy': 1},
      \ 'fnames': s:toml_lazy,
      \ }]

let s:load_the_plugins = function('s:load_plugins', [s:tomls])
unlet s:tomls s:toml_lazy

" Load plugins by Dein {{{1
if !exists('s:is_loaded')
  if dein#load_state($DEIN_CACHE_HOME)
    call dein#begin($DEIN_CACHE_HOME)
    " TODO: make faster to load tomls (it takes 1 sec. or more)
    call dein#add('Shougo/dein.vim') " Required
    if !has('nvim')
      call dein#add('roxma/nvim-yarp')
      call dein#add('roxma/vim-hug-neovim-rpc')
    endif
    call s:load_the_plugins()
    call dein#end()
    call dein#save_state()
  endif

  if dein#check_install() "{{{2
    call dein#install()
    if has('nvim')
      " call remote#host#UpdateRemotePlugins()
      call dein#remote_plugins()
    endif
  endif "}}}2

  filetype plugin indent on
  if !has('nvim')
    syntax on
  endif
  let s:is_loaded = 1
endif

augroup myDeinRc "{{{1
  if exists('#myDeinRc') | au! myDeinRc
  endif
  au BufWinEnter *vim**/*.toml call s:find_the_plugin()
  function! s:find_the_plugin() abort "{{{2
    let alt_path = fnamemodify(@#, ':p')
    if alt_path !~# '\v/(add|source|post)/.*\.vim$'
      return
    endif
    let config_fname = fnamemodify(alt_path, ':t:r')
    let pat = substitute(config_fname, '[-_]', '.', 'ge')
    let pat = 'repo = .*\zs'. pat

    exe 0
    call search(pat, 'w')
    norm! zvzz
  endfunction

  " Inititialize to source 'hook_post_source'.
  "au VimEnter * call dein#call_hook('post_source')
  " Note: keep it unused; unreloadable by `:source`
  "au BufWinEnter filetype.toml setl syn=vim
augroup END
