" From Init.toml

let g:neodark#use_256color    = 1 " default: 0
let g:neodark#italic          = 1 " default: 0
let g:neodark#background      = '#1F2F38'
" If you want solid vertical split matching the statusline:
let g:neodark#solid_vertsplit = 1 " default: 0
" Let; Terminal
let g:neodark#terminal_transparent      = 1 " default: 0
let g:neodark#use_custom_terminal_theme = 1 " default: 0

function! s:my_neodark_highlight() abort
  hi Special ctermfg=9  guifg=#1F2F38
  "hi Visual  ctermfg=15 ctermbg=13 guifg=#AABBC4 guibg=#475C69
  hi Cursorline guifg=#AABBC4
  hi Normal ctermfg=250 ctermbg=236 guifg=#AABBC4 guibg=#1F2F38
  " guibg=#13354A
endfunction

augroup MyNeodarkConf
  au!
  au BufRead * ++nested ++once colorscheme neodark
  "au ColorScheme * ++nested call s:my_neodark_highlight()
augroup END
