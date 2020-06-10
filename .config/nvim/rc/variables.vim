" From: init.vim

" Path; Suffix
"set suffixesadd=.vim

" $VAR; for shell {{{1
let $EDITOR     = 'nvr'
let $VISUAL     = 'nvr'
let $GIT_EDITOR = 'nvr -cc split --remote-wait'
let $VMAIL_VIM  = 'nvr'
"let $BROWSER    = 'qutebrowser'

"set shell=fish " keep shell=bash, most plugin-makers expects it.
"if executable('urxvt')
"  let $TERM = 'rxvt-unicode'
"else
"  let $TERM = 'xterm-256color'
"endif

" g:var; for Path {{{1
let $XDG_CACHE_HOME  = empty($XDG_CACHE_HOME)  ? $HOME .'/.cache/'       : $XDG_CACHE_HOME
let $XDG_CONFIG_HOME = empty($XDG_CONFIG_HOME) ? $HOME .'/.config/'      : $XDG_CONFIG_HOME
let $XDG_DATA_HOME   = empty($XDG_DATA_HOME)   ? $HOME .'/.local/share/' : $XDG_DATA_HOME

let $MY_MEMO = empty($MY_MEMO) ? $HOME .'/Memo/' : $MY_MEMO
let $MY_DEV  = empty($MY_DEV)  ? $HOME .'/dev/'  : $MY_DEV

let $DOTFILES_HOME = empty($DOTFILES_HOME) ? $HOME .'/dotfiles/' : $DOTFILES_HOME
let g:nvim_home = empty($VIMCONFIG) ? $DOTFILES_HOME .'/.config/nvim/' : $VIMCONFIG
let g:nvim_data_home = g:nvim_home . '/data/'
let g:my_css_home = '~/Downloads/css'
let g:my_trash_root = $XDG_DATA_HOME .'/Trash'

" $var; for Vim {{{1
if isdirectory('~/kaile256')
  let $MYVIMRC = expand('<sfile>')
  let $HOME    = expand('<sfile>:h')
endif

" &packpath {{{1
" default: &pp=~/.config/nvim,/etc/xdg/nvim,~/.local/share/nvim/site,/usr/local/share/nvim/site,/usr/share/nvim/site,/usr/share/nvim/runtime,/usr/share/nvim/site/after,/usr/local/share/nvim/site/after,~/.local/share/nvim/site/after,/etc/xdg/nvim/after,~/.config/nvim/after
" only I use in manjaro: /usr/share/nvim/runtime,~/.config/nvim/after
set packpath=

" &rtp; "{{{1
set rtp+=~/.config/nvim/lazy
set rtp+=~/.config/nvim/keymap

" Provider {{{1
if has('python3')
  let g:python3_host_prog = '/usr/bin/python3'
  "let g:python3_host_prog = $MY_MEMO .'/.local/Python-3.7.6'
  "let g:python3_host_prog = system('(type pyenv &>/dev/null && echo -n "$(pyenv root)/versions/$(pyenv global | grep python3)/bin/python") || echo -n $(which python3)')
endif
if has('python')
  let g:python_host_prog = system('(type pyenv &>/dev/null && echo -n "$(pyenv root)/versions/$(pyenv global | grep python2)/bin/python") || echo -n $(which python2)')
endif
let g:ruby_host_prog = '/usr/bin/ruby'
