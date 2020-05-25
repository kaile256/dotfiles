" From: init.vim

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
"" Font for gvim {{{1
"if has('unix')
"  " Note: when 'guifontset' is not empty, it replaces 'guifont'.
"  try
"    set guifontset=DejaVuSansMono\ Nerd\ Font:h12
"    set printfont=DejaVuSansMono\ Nerd\ Font:h12
"    "set linespace=0
"  catch
"    set guifontset=Monospace:h12
"    set printfont=Monospace:h12
"  endtry
"elseif has('win32\|win64')
"  try
"    set guifontset=SF_Mono:h12
"    set printfont=SF_Mono:h12
"  catch
"    set guifontset=Monospace\ 12
"    set printfont=Monospace\ 12
"  endtry
"endif
"
" if nvim-qt {{{1
if exists('g:GuiLoaded')

  GuiTabline   0
  GuiPopupmenu 0

  " Noto: google's; NO TO-fu
  "GuiLinespace -2
  "GuiFont! NotoSansMono Nerd Font:h14

  "GuiLinespace 1
  " SF Mono; San Francisco Mono
  " Note: &guifont also available
  " $ fc-list | rg Nerd | fzf
  "GuiFont! DejaVuSansMono Nerd Font:h13
  "GuiFont! Migu 1M:h14
  "GuiFont! Cica:h16 " weird for me
  " <bang> for Japanese, or other ambiwidth fonts
  "GuiFont! SF Mono:h12
  "GuiFont! Myrica M:h15

  " GuiFont! MesloLGS Nerd Font:h13
  GuiFont! Meslo LG S for Powerline:h13
  GuiLinespace -1
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
