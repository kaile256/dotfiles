if has('nvim')
  " the common settings
  set t_Co=256
  set termguicolors
  "set bg=light

  " when molokai theme
  colorscheme molokai
  let g:rehash256 = 1
  " make highlight clear on molokai.
  augroup myMolokai
    autocmd!
    autocmd ColorScheme * hi Search               ctermbg=155
    autocmd ColorScheme * hi Comment ctermfg=245
    autocmd ColorScheme * hi Number  ctermfg=245
    autocmd ColorScheme * hi Visual               ctermbg=227
  augroup END

  "" when solarized theme
  "let g:solarized_termcolors=256
  "colo solarized
endif
