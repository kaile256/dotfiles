" Help: options

" Appearance; Blend {{{
if exists('&pumblend')
  set pumblend=30
  set winblend=20
endif
"}}}
"" $VAR: DEVROOTs and $PATH {{{1
"let $DEVROOT = $HOME .'/dev'
"
"let s:path = {
"      \ '$GOPATH'      : '/go',
"      \ '$CARGO_HOME'  : '/cargo',
"      \ '$RUSTUP_HOME' : '/rustup',
"      \ '$PYENV_ROOT'  : '/env/pyenv',
"      \ }
"
"for i in keys(s:path)
"  let i = $DEVROOT . s:path[i]
"  let $PATH = i .'/bin:'. $PATH
"endfor
"unlet s:path
"
"let $GHQ_ROOT = $GOPATH .'/src'
"let $PATH = $PYENV_ROOT .'/shims:'. $PATH " instead of '$source (pyenv init - | psub)'
"
"let s:path = [
"      \ '/.yarn/bin',
"      \ '/.node_modules',
"      \ ]
"for i in s:path
"  let $PATH = $HOME . i .'/bin:'. $PATH
"endfor
"unlet s:path
"
"" $VAR; for shell {{{1
let $EDITOR     = 'nvr'
let $VISUAL     = 'nvr'
let $GIT_EDITOR = 'nvr -cc split --remote-wait'
"let $BROWSER    = 'qutebrowser'
"
""set shell=fish
if executable('urxvt')
  let $TERM = 'rxvt-unicode'
else
  let $TERM = 'xterm-256color'
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
  " Note: can set on &guifont
  "GuiFont! Ricty Nerd Font:h17
  "GuiFont! Migu 1M:h15
  " <bang> for Japanese.
  "GuiFont! SF Mono:h12
  "GuiFont! Myrica M:h15
  "if GuiName() ==# 'nvim-qt'
  "  " TODO: I'd like to use Japanese on Qt.
  "endif
endif

if exists('gonvim_running') "{{{1
  let g:gonvim_draw_statusline = 0
  let g:gonvim_draw_tabline = 0
  let g:gonvim_draw_lint = 1
  let g:gonvim_draw_split = 1
endif

if exists('g:GtkGuiLoaded') "{{{1
  call rpcnotify(1, 'Gui', 'Font', 'SF Mono 12')
endif
