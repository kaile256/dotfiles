" From: init.vim

" Path; Suffix
"set suffixesadd=.vim

" Set; Font {{{
if has('unix')
  try
    set guifont=SF\ Mono:h12
    set guifontwide=SF\ Mono:h15
    set guifontset=SF\ Mono:h15
    set printfont=SF\ Mono:h12
    "set linespace=0
  catch
    set guifont=Monospace:h12
    set printfont=Monospace:h12
  endtry
elseif has('win32\|win64')
  try
    set guifont=SF_Mono:h12
    set printfont=SF_Mono:h12
  catch
    set guifont=Monospace\ 12
    set printfont=Monospace\ 12
  endtry
endif
"}}}
" Set; Path for Backup {{{
" Write, on path,vim, the file directory paths.
set nobackup
set nowritebackup
set noswapfile
set undofile
"augroup PersistentUndo
"  au! BufWritePre /tmp/* setlocal noundofile
"augroup END
" XDG Base Repository
set undodir=~/.local/share/nvim/undo
"set directory=~/.local/share/nvim/swap
"set backupdir=~/.local/share/nvim/backup
"set viminfo='1000,n~/.local/share/nvim/info
"set runtimepath=$XDG_CONFIG_HOME/vim,http://eleclog.quitsq.com/2014/10/arch-on-x220.html?m=1$VIMRUNTIME,$XDG_CONFIG_HOME/vim/after
let g:netrw_home = '~/.local/share/nvim'
"}}}

" $VAR; for shell {{{
let $EDITOR     = 'nvr'
let $VISUAL     = 'nvr'
let $GIT_EDITOR = 'nvr -O --remote-wait'
let $VMAIL_VIM  = 'nvr'
"let $BROWSER    = 'qutebrowser'

"set shell=fish " keep shell=bash, most plugin-makers expects it.
if executable('urxvt')
  let $TERM = 'rxvt-unicode'
else
  let $TERM = 'xterm-256color'
endif
"}}}
" g:var; for Path {{{
"let g:config_home = stdpath('config')
"let g:cache_home  = stdpath('cache')
"let g:data_home   = stdpath('data')
let g:config_home = empty($XDG_CONFIG_HOME) ? expand('~/.config/') : $XDG_CONFIG_HOME
let g:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache/') : $XDG_CACHE_HOME
let g:data_home = empty($XDG_DATA_HOME) ? expand('~/.local/share/') : $XDG_DATA_HOME
let g:dotfiles_home  = '~/dotfiles/'
let g:nvim_home = empty($VIMCONFIG) ? expand(g:dotfiles_home .'/.config/nvim/') : $VIMCONFIG
let g:nvim_data_home = g:nvim_home . 'data/'
let g:dev_root = '~/dev/'

if !exists('g:kmDealer_cd_path_dict')
  let g:kmDealer_cd_path_dict = {}
endif
call extend(g:kmDealer_cd_path_dict, {
      \ 'v': g:nvim_home,
      \ 'l': g:data_home,
      \ 'f': g:config_home,
      \ 'd': g:dotfiles_home,
      \ }
      \ )

"}}}
" $var; for Vim {{{1
if isdirectory('~/kaile256')
  let $MYVIMRC = expand('<sfile>')
  let $HOME = expand('<sfile>:h')
endif
"}}}1

" &rtp; "{{{1
set rtp+=~/.config/nvim/data
set rtp+=~/.config/nvim/lazy
set rtp+=~/.config/nvim/toml
set rtp+=~/.config/nvim/keymap

" &path; for `:find` {{{1
" ';' for upward search.
" e.g., /usr/share/nvim;/usr will search in /usr, /usr/share, /usr/share/nvim.
"set path+=;/

" &path; Dein's cache
set path^=~/.cache/dein/repos/github.com/**
set path^=~/.config/**
set path^=../**
set path+=~/.local/nvim/**
set path+=/etc/**

" &path; negative
set path-=~
set path-=.git*/**
set path-=*yarn*/**
set path-=*node*/**

" Path; Provider {{{1
if has('python3')
  let g:python3_host_prog = '/usr/bin/python3'
  "let g:python3_host_prog = system('(type pyenv &>/dev/null && echo -n "$(pyenv root)/versions/$(pyenv global | grep python3)/bin/python") || echo -n $(which python3)')
endif
if has('python2')
  let g:python_host_prog = system('(type pyenv &>/dev/null && echo -n "$(pyenv root)/versions/$(pyenv global | grep python2)/bin/python") || echo -n $(which python2)')
endif
let g:ruby_host_prog = '/usr/bin/ruby'
