" TOML: colorscheme.toml
" Repo: flazz/vim-colorschemes
" Ref: post/coloschemes.vim
" Ref: source/coloschemes.vim

function! s:my_palenight() abort
  hi! link Whitespace Comment
  " hi! link lineNr Comment
  hi! SpecialKey ctermfg=245 guifg=#8a8a8a
  hi! NonText ctermfg=239 guifg=#4e4e4e

  " hi! Statement ctermfg=212 guifg=#fe82e3
  " hi! Identifier ctermfg=117 guifg=#b2fd8b
  " hi! Type ctermfg=117 guifg=#8be9fd

  " hi! link SignColumn Number

  " hi! Comment ctermfg=61 guifg=#ababab
  " hi! Folded ctermfg=61 guifg=#7988b8 ctermbg=235 guibg=#282a36

  hi! Visual ctermbg=241 guibg=#684380

  " hi! Search ctermfg=236 guifg=#353917 ctermbg=180 guibg=#b5b5e8 cterm=bold gui=bold
  "
  " hi! SpecialKey ctermfg=231 guifg=#69743f ctermbg=235
  "
  " hi! Error ctermfg=9 guifg=Red ctermbg=NONE guibg=NONE cterm=bold gui=bold

  " hi! DiffChange ctermfg=180 guifg=#ffcb6b ctermbg=235 guibg=#292D3E cterm=bold gui=bold
  " hi! DiffAdd    ctermfg=114 guifg=#C3E88D ctermbg=235 guibg=#292D3E cterm=bold gui=bold
  " hi! DiffDelete ctermfg=204 guifg=#ff5370 ctermbg=235 guibg=#292D3E cterm=bold gui=bold
  " hi! DiffText   ctermfg=235 guifg=#292D3E ctermbg=180 guibg=#ffcb6b cterm=bold gui=bold

  hi! DiffText cterm=bold gui=bold

  hi! NormalFloat ctermfg=190 guifg=#cfbd2f ctermbg=22 guibg=#0b4100 cterm=bold gui=bold

  hi! DoppelgangerVirtualText ctermfg=64 guifg=#5f8700 cterm=italic gui=italic
endfunction

if exists('#myPalenightPre') | finish | endif
augroup myPalenightPre
  au Colorscheme palenight ++nested call s:my_palenight()
augroup END
