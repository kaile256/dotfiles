" From Init.toml

let g:monokai_term_italic = 1
let g:monokai_gui_italic = 1

augroup MyMonokai
  au!
  au VimEnter * ++nested colorscheme monokai
augroup END
