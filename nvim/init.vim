set encoding=utf-8
scriptencoding utf-8

" Variable; Home {{{
if isdirectory('~/kaile256')
  let $MYVIMRC = expand('<sfile>')
  let $HOME = expand('<sfile>:h')
endif
"}}}
" Variable; XDG {{{
let g:config_home = empty($XDG_CONFIG_HOME) ? expand('~/.config')      : $XDG_CONFIG_HOME
let g:cache_home  = empty($XDG_CACHE_HOME)  ? expand('~/.cache')       : $XDG_CACHE_HOME
let g:data_home   = empty($XDG_DATA_HOME)   ? expand('~/.local/share') : $XDG_DATA_HOME
"}}}
" Variable; Terminal {{{
if executable('urxvt')
  let $TERM='rxvt-unicode'
else
  let $TERM='xterm-256color'
endif
"}}}
" Variable; Git {{{
if has('nvim')
  let $GIT_EDITOR = 'nvr -cc split --remote-wait'
endif
"let $SHELL='bash'
"}}}

rntime path.vim
" WARNING: `!` is required to source all the same named files.
runtime script.vim
runtime rc/dein.vimrc
"runtime plugged.vimrc
runtime! keymap/*.vim

augroup RuntimeSelect "{{{0
  au!

  au CmdLineEnter * ++once runtime lazy/cabbr.vim
  au TermOpen     * ++once runtime lazy/terminal.vim

  au BufRead      * ++once if &ft == 'diff' | runtime lazy/diff.vim | endif

augroup END
