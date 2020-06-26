" TOML: insert.toml
" Repo: aperezdc/vim-template
" Another: source/template.vim

augroup myTemplate-autoStart
  au!
  au BufNewFile */atcoder/*.cpp :Template atcoder.cpp
augroup END

