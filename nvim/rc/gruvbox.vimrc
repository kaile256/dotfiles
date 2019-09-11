" From: Init.toml
" Repo: morhetz/gruvbox

"let g:gruvbox_contrast_dark = 'hard'

if $TERM =~# 'rxvt\|gnome'
  let g:gruvbox_italic = 1
endif

augroup MyColoAugroup
  au!
  if !exists('g:GuiLoaded')
    au VimEnter * nested ++once colorscheme gruvbox
  endif
  "au Colorscheme * call <SID>my_gruvbox_highlight()
augroup END
