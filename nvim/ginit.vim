"""" Help: options

if exists('g:GuiLoaded')
  GuiLinespace 0
  GuiTabline 0
  GuiPopupmenu 0
endif

set guifont=SF\ Mono:h12
set guifontwide=SF\ Mono:h12

"""" ENV
if GuiName() == 'nvim-qt'
  let $EDITOR='nvim-qt'
  let $VISUAL='nvim-qt'
endif

if executable('qutebrowser')
  let $BROWSER='qutebrowser'
endif
