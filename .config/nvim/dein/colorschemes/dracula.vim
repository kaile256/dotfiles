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
  hi! Todo ctermfg=199 ctermbg=15 guifg=#c75895 guibg=#ffffff

  hi! Comment ctermfg=61 guifg=#ababab
  hi! Folded ctermfg=61 ctermbg=235 guifg=#7988b8 guibg=#282a36

  hi! Visual ctermbg=241 guibg=#684380

  hi! Search cterm=bold gui=bold ctermfg=236 ctermbg=180 guifg=#353917 guibg=#b5b5e8
endfunction
