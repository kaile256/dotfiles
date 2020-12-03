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

" Load plugins by Dein {{{1
if dein#load_state($DEIN_CACHE_HOME)
  call dein#begin($DEIN_CACHE_HOME)
  " TODO: make faster to load tomls (it takes 1 sec. or more)
  call dein#add('Shougo/dein.vim') " Required
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  function! s:load_plugins() abort
    " Read all the tomls under specified directories.

    let config = {
          \ 'init': {},
          \ 'lazy': { 'lazy': 1 },
          \ 'nvim_only': {
          \   'lazy': 1,
          \   'if': 'has("nvim")',
          \   },
          \ 'vim_only': {
          \   'lazy': 1,
          \   'if': '!has("nvim")',
          \   },
          \ }

    for label in keys(config)
      let opt = config[label]
      let expr = get(opt, 'if', 1)
      if eval(expr) == 0 | continue | endif

      let toml_dir = $DEIN_TOML_HOME .'/'. label
      for fname in readdir(toml_dir)
        let toml_path = toml_dir .'/'. fname
        call dein#load_toml(toml_path, opt)
      endfor
    endfor
  endfunction
  call s:load_plugins()

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

augroup myDeinRc "{{{1
  au BufWinEnter *vim**/*.toml call s:find_the_plugin()
  function! s:find_the_plugin() abort "{{{2
    " Note: it's useless under ftplugin/.
    let alt_path = fnamemodify(@#, ':p')
    if alt_path !~# '\v/(add|source|post|ftplugin)/' | return | endif

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
