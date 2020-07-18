" TOML: colorscheme.toml
" Repo: flazz/vim-colorschemes/colors/spring-night.vim
" Repo: rhysd/vim-color-spring-night
" Another: source/spring-night.vim

function! s:my_spring_night() abort
  hi! Visual ctermbg=3 guibg=#808000
endfunction

if exists('#mySpringNightPre') | finish | endif
augroup mySpringNightPre
  au ColorScheme spring-night ++nested call s:my_spring_night()
augroup END
