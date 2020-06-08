if exists('g:GuiLoaded') " if nvim-qt
  " /usr/share/nvim-qt/runtime/plugin/nvim_gui_shim.vim
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

elseif exists('gonvim_running')
  let g:gonvim_draw_statusline = 0
  let g:gonvim_draw_tabline = 0
  let g:gonvim_draw_lint = 1
  let g:gonvim_draw_split = 1

elseif exists('g:GtkGuiLoaded')
  call rpcnotify(1, 'Gui', 'Font', 'SF Mono 12')
endif
