" TOML: appearance.toml
" Repo: luochen1990/rainbow
" Another: add/rainbow.vim

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
      \ 'defx': 0,
      \ 'dockerfile': 0,
      \ 'fzf': 0,
      \ 'gina-log': 0,
      \ 'gitcommit': 0,
      \ 'help': 0,
      \ 'man': 0,
      \ 'qf': 0,
      \ 'ranger': 0,
      \ 'toml': 0,
      \ }

if has('nvim') && dein#tap('nvim-ts-rainbow')
  call extend(g:rainbow_conf.separately, {
        \ 'bash': 0,
        \ 'c': 0,
        \ 'clojure': 0,
        \ 'cpp': 0,
        \ 'css': 0,
        \ 'dart': 0,
        \ 'fish': 0,
        \ 'haskell': 0,
        \ 'java': 0,
        \ 'javascript': 0,
        \ 'json': 0,
        \ 'jsonc': 0,
        \ 'julia': 0,
        \ 'kotlin': 0,
        \ 'latex': 0,
        \ 'lua': 0,
        \ 'nix': 0,
        \ 'ocaml': 0,
        \ 'php': 0,
        \ 'python': 0,
        \ 'r': 0,
        \ 'ruby': 0,
        \ 'rust': 0,
        \ 'tsx': 0,
        \ 'typescript': 0,
        \ 'yaml': 0,
        \ })
endif


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
        \ 'blue',
        \ 'yellow',
        \ 'green',
        \ 'brown',
        \ ]

  " Ref: $VIMRUNTIME/rgb.txt
  " Note: Value can be a list with two different values like
  " `'yellow': ['Yellow', 'FireBrick3 gui=bold']`.
  let cterm2gui = {
        \ 'white': ['253', '#dadada'],
        \ 'magenta': 'Magenta3 gui=bold',
        \ 'blue': ['blue', 'DeepSkyBlue1 gui=bold'],
        \ 'turquoise': ['Cyan', 'Turquoise gui=bold'],
        \ 'orange': ['Red', 'DarkOrange'],
        \ 'green': ['Green cterm=bold', 'SeaGreen3 gui=bold'],
        \ 'brown': 'Brown3 gui=bold',
        \ 'yellow': ['Yellow', 'FireBrick3 gui=bold'],
        \ }

  let g:rainbow_conf.ctermfgs = []
  let g:rainbow_conf.guifgs   = []
  for color_name in colors_order
    let color = cterm2gui[color_name]
    if type(color) == type([])
      let idx4gui = len(color) == 1 ? 0 : 1
      let [ctermfg, guifg] = [color[0], color[idx4gui]]
    else
      " Set identical values here if not a list; modify them later.
      let [ctermfg, guifg] = [color, color]
    endif

    let ctermfg = substitute(ctermfg, '\a\zs\d\+', '', 'g')
    let ctermfg = substitute(ctermfg, 'gui=', 'cterm=', 'g')
    let guifg   = substitute(guifg, 'cterm=', 'gui=', 'g')

    call add(g:rainbow_conf.ctermfgs, ctermfg)
    call add(g:rainbow_conf.guifgs,   guifg)
  endfor
endfunction
" Some cterm color could cause error E421.
call s:set_color()
delfunction s:set_color
