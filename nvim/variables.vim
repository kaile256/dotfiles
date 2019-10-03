" From: init.vim

" Path; Suffix
"set suffixesadd=.vim

" Set; Font {{{
if has('unix')
  try
    set guifont=SF\ Mono:h12
    set guifontwide=SF\ Mono:h12
    set guifontset=SF\ Mono:h12
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

" g:var; for Path {{{
"let g:config_home = stdpath('config')
"let g:cache_home  = stdpath('cache')
"let g:data_home   = stdpath('data')
let g:config_home  = empty($XDG_CONFIG_HOME) ? expand('~/.config/')      :         $XDG_CONFIG_HOME
let g:cache_home   = empty($XDG_CACHE_HOME)  ? expand('~/.cache/')       :         $XDG_CACHE_HOME
let g:data_home    = empty($XDG_DATA_HOME)   ? expand('~/.local/share/') :         $XDG_DATA_HOME
let g:my_dotfiles  = '~/dotfiles/'
let g:my_nvim_home = empty($VIMCONFIG)       ? expand(g:my_dotfiles      .'nvim/') : $VIMCONFIG
let g:my_data      = g:my_nvim_home           . 'data/'
"}}}
" $var; for Terminal {{{
"set shell=fish
if executable('urxvt')
  let $TERM='rxvt-unicode'
else
  let $TERM='xterm-256color'
endif
"}}}
" $var; for Git {{{
if has('nvim')
  let $GIT_EDITOR = 'nvr -cc split --remote-wait'
endif
"}}}
" $var; for Vim {{{1
if isdirectory('~/kaile256')
  let $MYVIMRC = expand('<sfile>')
  let $HOME = expand('<sfile>:h')
endif
let $EDITOR='nvr'
let $VISUAL='nvr'

" $var: for Dev {{{1
let $DEVROOT=expand($HOME) .'/dev'
let $GOPATH=expand($DEVROOT) .'/go'
let $PATH=expand($GOPATH) .'/bin:'. expand($PATH)
"}}}

" Path; Runtime Path
set rtp+=~/.config/nvim/data
set rtp+=~/.config/nvim/lazy
set rtp+=~/.config/nvim/toml
set rtp+=~/.config/nvim/keymap
" Path; for `:find`
" ';' for upward search.
" e.g., /usr/share/nvim;/usr will search in /usr, /usr/share, /usr/share/nvim.
"set path+=;/
" Dein's cache
set path^=~/.cache/dein/repos/github.com/**
set path^=~/.config/**
set path^=../**
set path+=~/.local/nvim/**
set path+=/etc/**
" Path; negative
set path-=~
set path-=.git*/**
set path-=*yarn*/**
set path-=*node*/**
" Path; Provider
if has('python3')
  let g:python3_host_prog = '/usr/bin/python3'
  "let g:python3_host_prog = system('(type pyenv &>/dev/null && echo -n "$(pyenv root)/versions/$(pyenv global | grep python3)/bin/python") || echo -n $(which python3)')
endif
if has('python2')
  let g:python_host_prog = system('(type pyenv &>/dev/null && echo -n "$(pyenv root)/versions/$(pyenv global | grep python2)/bin/python") || echo -n $(which python2)')
endif
let g:ruby_host_prog = '/usr/bin/ruby'
