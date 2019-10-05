" From: Init.toml

augroup MyIcebergConf
  au!
  au VimEnter * nested ++once colorscheme iceberg
augroup END

" TODO: iceberg with neodark's bg
function! s:my_iceberg_highlight() abort
  "hi Special ctermfg=9  guifg=#1F2F38
  ""hi Visual  ctermfg=15 ctermbg=13 guifg=#AABBC4 guibg=#475C69
  "hi Cursorline guifg=#AABBC4
  hi Normal ctermfg=250 ctermbg=236 guifg=#AABBC4 guibg=#1F2F38
endfunction
