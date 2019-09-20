" From: appearance.toml

function! s:colorschemes_neodark() abort "{{{1
  "let g:neodark#use_256color    = 1 " default: 0
  let g:neodark#italic          = 1 " default: 0
  let g:neodark#terminal_transparent      = 1 " default: 0
  let g:neodark#use_custom_terminal_theme = 1 " default: 0
  colorscheme neodark
endfunction "}}}

if exists("g:nyaovim_version")
  colorscheme flattened_dark
elseif !exists("g:GuiLoaded")
  " on CUI
  let g:solarized_termcolors=256
  colorscheme solarized8_dark_flat
else
  call <SID>colorschemes_neodark()
endif
