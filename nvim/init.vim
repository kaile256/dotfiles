set encoding=utf-8
scriptencoding utf-8
set fileencodings=ucs-bom,utf-8,euc-jp,sjis,default,latin1
set ambiwidth=double
hi CursorIM guibg=#fabd1f
" default: tcqj
set formatoptions=tcqjmB1
set comments+=:f:O

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
"let $SHELL='zsh'
"let $SHELL='fish'
"}}}

" WARNING: `!` is required to source all the same named files.
runtime script.vim
runtime filetype.vim
runtime window.vim
runtime buffer.vim
runtime! keymap/*.vim
runtime rc/dein.vimrc
"runtime plugged.vimrc

augroup RuntimeSelection
  au!

  au CmdLineEnter * ++once runtime lazy/cmdline.vim
  au BufNew       * ++once runtime lazy/terminal.vim

  au BufRead * if &diff | runtime lazy/diff.vim | endif
  "au FilterReadPost * runtime lazy/diff.vim

  au BufRead * if &ft == 'vim'  | runtime lazy/vim.vim  | endif
  au BufRead * if &ft == 'toml' | runtime lazy/toml.vim | endif
  au BufRead * if &ft == 'help' | runtime lazy/help.vim | endif
  au BufRead * if &ft == 'json' | runtime lazy/json.vim | endif
  au BufRead * if &ft == 'i3'   | runtime lazy/i3.vim   | endif
  au BufRead * if &ft == 'ruby' | runtime lazy/ruby.vim | endif

  au BufRead * if &ft == 'python' | runtime lazy/python.vim | endif

  au BufEnter * if &bt == 'quickfix' | runtime lazy/quickfix.vim | endif

augroup END
