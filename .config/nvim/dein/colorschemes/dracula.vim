" TOML: appearance.toml
" Repo: flazz/vim-colorschemes
" Ref: post/coloschemes.vim
" Ref: source/coloschemes.vim

augroup myDracula
  if exists('#myDracula') | au! myDracula
  endif
  au Colorscheme dracula ++nested call s:my_dracula()
augroup END

function! s:my_dracula() abort
  hi! Todo ctermfg=199 ctermbg=15 guifg=#fa57b0 guibg=#ffffff

  hi! Comment ctermfg=61 guifg=#ababab
  hi! Folded ctermfg=61 ctermbg=235 guifg=#7988b8 guibg=#282a36

  hi! Visual ctermbg=241 guibg=#684380

  hi! Search cterm=bold gui=bold ctermfg=236 ctermbg=180 guifg=#353917 guibg=#b5b5e8

  hi! SpecialKey ctermfg=231 ctermbg=235 guifg=#69743f

  hi! Error cterm=bold gui=bold ctermfg=9 ctermbg=NONE guifg=Red guibg=NONE

  hi! DiffChange cterm=bold gui=bold ctermfg=179 guifg=#d7af5f ctermbg=NONE guibg=NONE
  hi! DiffRemove cterm=bold gui=bold ctermfg=167 guifg=#fb4934 ctermbg=NONE guibg=NONE
  hi! DiffAdd    cterm=bold gui=bold ctermfg=74  guifg=#3dff17 ctermbg=NONE guibg=NONE
  hi! DiffText   cterm=bold gui=bold ctermfg=208 guifg=#fe8019 ctermbg=NONE guibg=NONE

  set winblend=40
  hi! NormalFloat cterm=bold gui=bold ctermfg=190 guifg=#cfbd2f ctermbg=22 guibg=#0b4100
endfunction
