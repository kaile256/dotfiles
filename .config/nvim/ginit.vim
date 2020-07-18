if exists('g:GuiLoaded') " if nvim-qt
  " /usr/share/nvim-qt/runtime/plugin/nvim_gui_shim.vim
  GuiTabline   0
  GuiPopupmenu 0

  " <bang> for Japanese and other ambiwidth fonts
  " GuiFont! JetBrainsMono Nerd Font:h10.9
  GuiFont! JetBrainsMonoMedium Nerd Font:h10.8
  GuiLinespace -1

elseif exists('gonvim_running')
  let g:gonvim_draw_statusline = 0
  let g:gonvim_draw_tabline = 0
  let g:gonvim_draw_lint = 1
  let g:gonvim_draw_split = 1

elseif exists('g:GtkGuiLoaded')
  call rpcnotify(1, 'Gui', 'Font', 'SF Mono 12')
endif
