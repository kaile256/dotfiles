" TOML: xampp.toml
" Repo: mattn/emmet-vim

let g:user_emmet_mode = 'n'

let g:user_emmet_leader_key = '<Plug>(nop)'

let g:user_emmet_install_global = 0

augroup myEmmetSou
  au!
  au FileType html,css,php EmmetInstall
augroup END
