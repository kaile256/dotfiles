" Help: options

if exists('g:GuiLoaded')

  GuiLinespace 0
  GuiTabline   0
  GuiPopupmenu 0

  GuiFont SF Mono:h12
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

"if exists('g:nyaovim_version')
"endif
