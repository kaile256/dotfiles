" TOML: colorscheme.toml
" Repo: flazz/vim-colorschemes/colors/spring-night.vim
" Repo: rhysd/vim-color-spring-night
" Another: source/spring-night.vim

function! s:my_spring_night() abort
  hi! Visual ctermbg=58 guibg=#505014
endfunction

if exists('#mySpringNightPre') | finish | endif
augroup mySpringNightPre
  au ColorScheme spring-night ++nested call s:my_spring_night()
augroup END

function! s:my_spring_night() abort
  hi! link NvimInternalError Error
endfunction
