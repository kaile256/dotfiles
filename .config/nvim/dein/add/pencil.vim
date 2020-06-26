" From: insert.toml
" Repo: reedes/vim-pencil
" Another: add/pencil.vim

function! s:pencil(label) abort
  call pencil#init(s:config[label])
endfunction

let s:config = {}

let s:config['commit'] = {
      \ 'wrap': 'hard',
      \ 'textwidth': 72,
      \ }

let s:config['markdown'] = {
      \ 'wrap': 'soft',
      \ 'textwidth': &tw > 0 ? &tw : 79,
      \ }

let s:config['mail'] = {
      \ 'wrap': 'soft',
      \ 'textwidth': &tw > 0 ? &tw : 60,
      \ }

augroup myPencil
  au!
  " Note: 'colorcolumn' fails to work this plugin
  au OptionSet * if &virtualedit ==# 'block' | set ve=block | endif
  au OptionSet colorcolumn,textwidth call s:colorcolumn()

  au Filetype mail call s:pencil('mail')
  au Filetype html,xml           call s:pencil('markdown')
  au FileType markdown,text,help call s:pencil('markdown')
  au Filetype git,gitsendemail,*commit*,*COMMIT* call s:pencil('commit')
augroup END

function! s:colorcolumn() abort
  let textwidth = &tw > 0 ? &tw : get(g:, 'pencil#textwidth', 79)
  exe 'setl colorcolumn='. (textwidth > 0 ? textwidth : 79) + 1
endfunction

