" Help: options

" $VAR: for Dev {{{1
let $DEVROOT=expand($HOME) .'/dev'
let $GOPATH=expand($DEVROOT) .'/go'

" $VAR: for PATH {{{1
let $PATH=expand($GOPATH) .'/bin:'. expand($PATH)
"let $PATH=expand($PATH). ':'. expand($HOME) .'.yarn/bin:'

" $VAR; for shell {{{1
let $EDITOR='nvr'
let $VISUAL='nvr'
let $GIT_EDITOR = 'nvr -cc split --remote-wait'
let $BROWSER = 'qutebrowser'

"set shell=fish
if executable('urxvt')
  let $TERM='rxvt-unicode'
else
  let $TERM='xterm-256color'
endif


" if nvim-qt {{{1
if exists('g:GuiLoaded')

  GuiTabline   0
  GuiPopupmenu 0

  " Noto: google's; NO TO-fu
  "GuiLinespace -2
  "GuiFont! NotoSansMono Nerd Font:h14

  GuiLinespace 0
  " SF Mono; San Francisco Mono
  GuiFont SF Mono:h12
  "GuiFont! Ricty Nerd Font:h17
  "GuiFont! Myrica M:h15
  if GuiName() ==# 'nvim-qt'
    " TODO: I'd like to use Japanese on Qt.
  endif
endif

if exists('gonvim_running') "{{{1
  let g:gonvim_draw_statusline = 0
  let g:gonvim_draw_tabline = 0
  let g:gonvim_draw_lint = 1
  let g:gonvim_draw_split = 1
endif
