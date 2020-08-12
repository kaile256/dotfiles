" TOML: appearance.toml
" Repo: luochen1990/rainbow
" Another: add/rainbow-luochen1990.vim

let g:rainbow_active = 1

" Ref: luochen1990/rainbow/autoload/rainbow_main.vim #3
let g:rainbow_conf = {}

" extend() will be applied to the copy
let g:rainbow_conf.operators = ''
let g:rainbow_conf.parentheses = [
      \ 'start=/{/ end=/}/ fold',
      \ 'start=/(/ end=/)/ fold',
      \ 'start=/\[/ end=/]/ fold',
      \ ]

" to disable, apply 0.
let g:rainbow_conf.separately = {
      \ 'help': 0,
      \ 'fzf': 0,
      \ 'toml': 0,
      \ }
" let g:rainbow_conf.separately = {
"      \ 'vim': {
"      \   'parentheses_options': 'containedin=vimFuncBody,vimExecute',
"      \   'parentheses': ['start=/\[/ end=/\]/'],
"      \   }
"      \ }

" Set colors {{{1

function! s:set_color() abort
  let colors_order = [
        \ 'white',
        \ 'magenta',
        \ 'orange',
        \ 'green',
        \ 'brown',
        \ 'yellow',
        \ ]

  " Ref: $VIMRUNTIME/rgb.txt
  let cterm2gui = {
        \ 'white': [233, 233],
        \ 'magenta': ['Magenta cterm=bold', 'Magenta3 gui=bold'],
        \ 'orange': ['Red', 'DarkOrange'],
        \ 'green': ['Green cterm=bold', 'SeaGreen3 gui=bold'],
        \ 'brown': ['Brown cterm=bold', 'Brown3 gui=bold'],
        \ 'yellow': ['Yellow', 'FireBrick3 gui=bold'],
        \ }

  let g:rainbow_conf.ctermfgs = []
  let g:rainbow_conf.guifgs   = []
  for color_name in colors_order
    call add(g:rainbow_conf.ctermfgs, cterm2gui[color_name][0])
    call add(g:rainbow_conf.guifgs,   cterm2gui[color_name][1])
  endfor
endfunction
call s:set_color()
delfunction s:set_color
