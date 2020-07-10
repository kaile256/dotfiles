" TOML: denite.toml
" Repo: neoclide/denite-git
" Another: add/denite-git.vim

finish

augroup myDeniteGit
  au!
  " TODO: Specify denite-git to set up the mappings.
  au FileType *
augroup END

" Reset works different up to the actions
"   on gitlog:    git-reset with the commit
"   on gitstatus: git-reset/checkout/remove for the files
call denite#custom#map(
      \ 'normal', 'R',
      \ '<denite:do_action:reset>',
      \ 'noremap'
      \)

call denite#custom#map(
      \ 'normal', 'a',
      \ '<denite:do_action:add>',
      \ 'noremap'
      \)

call denite#custom#map(
      \ 'normal', 'd',
      \ '<denite:do_action:delete>',
      \ 'noremap'
      \)

call denite#custom#map(
      \ 'normal', 'r',
      \ '<denite:do_action:reset>',
      \ 'noremap'
      \)
