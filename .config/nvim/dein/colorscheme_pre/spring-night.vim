" TOML: colorscheme.toml
" Repo: flazz/vim-colorschemes/colors/spring-night.vim
" Repo: rhysd/vim-color-spring-night
" Another: source/spring-night.vim

function! s:my_spring_night() abort
  hi! link NvimInternalError Error

  hi! Quote ctermfg=250 guifg=#bcbcbc
  hi! Visual ctermbg=58 guibg=#505014
  hi! Folded ctermfg=189 ctermbg=235 guifg=#e7d5ff guibg=#3a4b5c

  " TSCurrentScope: used with nvim-treesitter-refactor's highlight_current_scope
  hi! TSCurrentScope guibg=#0b3d4d ctermbg=23
endfunction

if exists('#mySpringNightPre') | finish | endif
augroup mySpringNightPre
  au ColorScheme spring-night ++nested call s:my_spring_night()
augroup END
