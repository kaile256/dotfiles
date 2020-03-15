" TOML: appearance.toml
" Repo: luochen1990/rainbow
" Another: add/luochen1990-rainbow.vim

let g:rainbow_active = 1

let g:rainbow_conf = {}

" extend() will be applied to the copy
let g:rainbow_conf.operators = ''

let g:rainbow_conf.parentheses = [
      \ 'start=/{/ end=/}/ fold'
      \ ]

let g:rainbow_conf.separately = {
      \ 'vim': {
      \   'parentheses_options': 'containedin=vimFuncBody,vimExecute',
      \   'parentheses': ['start=/\[/ end=/\]/'],
      \   }
      \ }
