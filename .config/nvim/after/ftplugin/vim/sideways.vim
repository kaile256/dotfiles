" TOML: operator.toml
" Repo: AndrewRadev/sideways.vim
" Another: add/sideways.vim

if !dein#tap('sideways.vim') | finish | endif

" FIXME: Exchange autocmd events
let b:sidewyas_definitions = [{
      \ 'start': 'au\%[tocmd]!\?',
      \ 'end': '.',
      \ 'delimiter': ',',
      \ 'brackets': ['', ''],
      \ }]

