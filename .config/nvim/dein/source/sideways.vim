" TOML: operator.toml
" Repo: AndrewRadev/sideways.vim
" Another: add/sideways.vim

finish

let g:sideways_definitions = [{
      \ 'start':     '(\_s*',
      \ 'end':       ')',
      \ 'delimiter': ',\_s*',
      \ 'brackets':  ['([{''"', ')]}''"'],
      \ }, {
      \ 'start':     '\[\_s*',
      \ 'end':       '\]',
      \ 'delimiter': ',\_s*',
      \ 'brackets':  ['([{''"', ')]}''"'],
      \ }, {
      \ 'start':     '{\_s*',
      \ 'end':       '}',
      \ 'delimiter': ',\_s*',
      \ 'brackets':  ['([{''"', ')]}''"'],
      \ }]

