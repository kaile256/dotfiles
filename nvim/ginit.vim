"""" Help: options

if exists('g:GuiLoaded')

  GuiLinespace 0
  GuiTabline   0
  GuiPopupmenu 0

  "if GuiName() == 'nvim-qt'
  "  let $EDITOR='nvr'
  "  let $VISUAL='nvr'
  "  augroup ToggleSudoEdit
  "    au!

  "    " Bug?: neovim automatically renames target-filename on `sudoedit`
  "    au TermOpen  * let $VISUAL='vim'
  "    au TermClose * let $VISUAL='vim'
  "endif
endif

set guifont=SF\ Mono:h12
set guifontwide=SF\ Mono:h12

"""" ENV

if executable('qutebrowser')
  let $BROWSER='qutebrowser'
endif
