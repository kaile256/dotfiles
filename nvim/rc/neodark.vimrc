" From Init.toml

"let g:neodark#use_256color = 1 " default: 0

" If you want solid vertical split matching the statusline:
let g:neodark#solid_vertsplit = 1 " default: 0

let g:neodark#terminal_transparent = 1 " default: 0
let g:neodark#use_custom_terminal_theme = 1 " default: 0

augroup MyColoAugroup
  au!
  au VimEnter * nested colorscheme neodark
augroup END

