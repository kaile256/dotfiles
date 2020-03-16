" TOML: appearance.toml
" From: frazrepo/vim-rainbow
" Another: add/rainbow-frazrepo.vim

" activate on any filetypes if g:rainbow_load_separately doesn't exist.
let g:rainbow_active = 1

let g:rainbow_disable_operator = 1

" [FileType, [pairs]]
" au syntax,colorscheme %s call rainbow#load(ps[%d][1])
let g:rainbow_load_separately = [
      \ [ '*' , [['{', '}']], ''],
      \ [ '*.vim' , [['\[', '\]']], ''],
      \ ['*.cpp', ['\v%(<operator\_s*)@<!%(%(\i|^\_s*|template\_s*)@<=\<[<#=]@!|\<@<!\<[[:space:]<#=]@!)', '\v%(-)@<!\>']],
      \ ['*.rs'], [['\v%(\i|^\_s*)@<=\<[<#=]@!|\<@<!\<[[:space:]<#=]@!', '\v%(-)@<!\>']],
      \ ]

let g:rainbow_guifgs = [
      \ 'RoyalBlue3',
      \ 'SeaGreen3',
      \ 'DarkOrchid3',
      \ 'firebrick3',
      \ 'RoyalBlue3',
      \ 'SeaGreen3',
      \ 'DarkOrchid3',
      \ 'firebrick3',
      \ 'RoyalBlue3',
      \ 'SeaGreen3',
      \ 'DarkOrchid3',
      \ 'firebrick3',
      \ 'RoyalBlue3',
      \ 'SeaGreen3',
      \ 'DarkOrchid3',
      \ 'firebrick3',
      \ ]
