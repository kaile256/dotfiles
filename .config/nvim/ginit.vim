if exists('g:GuiLoaded') " if nvim-qt
  " /usr/share/nvim-qt/runtime/plugin/nvim_gui_shim.vim
  GuiTabline   0
  GuiPopupmenu 0

  " <bang> for Japanese and other ambiwidth fonts
  if system('xrandr | grep " connected"') =~# 'HDMI1'
    GuiFont! JetBrainsMonoMedium Nerd Font:h9.2
  else
    GuiFont! JetBrainsMonoMedium Nerd Font:h10.8
  endif
  GuiLinespace -1

elseif exists('gonvim_running')
  let g:gonvim_draw_statusline = 0
  let g:gonvim_draw_tabline = 0
  let g:gonvim_draw_lint = 1
  let g:gonvim_draw_split = 1

elseif exists('g:GtkGuiLoaded')
  call rpcnotify(1, 'Gui', 'Font', 'JetBrainsMonoMedium Nerd Font 12')
endif
