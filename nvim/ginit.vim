" Help: options

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

if exists('gonvim_running')
  let g:gonvim_draw_statusline = 0
  let g:gonvim_draw_tabline = 0
  let g:gonvim_draw_lint = 1
  let g:gonvim_draw_split = 1
endif
