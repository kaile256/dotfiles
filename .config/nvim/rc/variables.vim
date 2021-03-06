" From: init.vim

" Path; Suffix
"set suffixesadd=.vim

" $VAR; for shell {{{1
if has('nvim') && executable('nvr')
  let $EDITOR     = 'nvr'
  let $VISUAL     = 'nvr'
  " Without split, nvr doesn't work for git-editor.
  let $GIT_EDITOR = 'nvr --remote-wait -cc "split | set bufhidden=delete"'
  let $VMAIL_VIM  = 'nvr'
elseif has('gui_running')
  let $EDITOR     = 'gvim --remote-wait-silent'
  let $VISUAL     = 'gvim --remote-wait-silent'
  let $GIT_EDITOR = 'gvim --remote-wait-silent'
  let $VMAIL_VIM  = 'gvim --remote-wait-silent'
else
  let $EDITOR     = 'vim --remote-wait-silent'
  let $VISUAL     = 'vim --remote-wait-silent'
  let $GIT_EDITOR = 'vim --remote-wait-silent'
  let $VMAIL_VIM  = 'vim --remote-wait-silent'
endif
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
let $NVIM_CONFIG_HOME = $XDG_CONFIG_HOME .'/nvim/'
let $VIM_CONFIG_HOME = $HOME .'/.vim/'
let $VIM_ANOTHER_HOME = $VIM_CONFIG_HOME
let $VIM_PACK_HOME = expand('$VIMRUNTIME/pack/dist/opt')
let g:my_css_home = '~/Downloads/css'
let $VIM_TEMPLATE_HOME = expand('$VIM_ANOTHER_HOME/sonictemplate')

" $var; for Vim {{{1
if isdirectory('~/kaile256')
  let $MYVIMRC = expand('<sfile>')
  let $HOME    = expand('<sfile>:h')
endif

" &packpath {{{1
" default: &pp=~/.config/nvim,/etc/xdg/nvim,~/.local/share/nvim/site,/usr/local/share/nvim/site,/usr/share/nvim/site,/usr/share/nvim/runtime,/usr/share/nvim/site/after,/usr/local/share/nvim/site/after,~/.local/share/nvim/site/after,/etc/xdg/nvim/after,~/.config/nvim/after
" only I use in manjaro: /usr/share/nvim/runtime,~/.config/nvim/after
set packpath=

" Provider {{{1
let g:ruby_host_prog = '/usr/bin/ruby'

if has('python3')
  let g:python3_host_prog = '/usr/bin/python3'
endif

" Note: According to a `--startuptime` result,
" `runtime/autoload/provider/python.vim` is the heaviest script. Don't use
" those plugins that depends on it as `python` is deprecated in favor of
" `python3`.
let g:loaded_python_provider = 1
finish

if has('python')
  let g:python_host_prog = '/usr/bin/python2'
endif
