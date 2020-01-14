" From: insert.toml
" Repo: reedes/vim-pencil
" Another: post/pencil.vim

let g:pencil#wrapModeDefault = 'soft' " default: 'hard'
let g:pencil#textwidth       = 79     " default: 74
"let g:pencil#autoformat = 0 " 0=disable, 1=enable (default)

augroup myPencil
  au!
  " Note: 'colorcolumn' fails to work this plugin
  au OptionSet colorcolumn,textwidth call s:colorcolumn()

  au Filetype git,gitsendemail,*commit*,*COMMIT* call s:pencil.commit()
  au FileType markdown,text,help                 call s:pencil.markdown()
  au Filetype mail     call s:pencil.mail()
  au Filetype html,xml call s:pencil.html()
augroup END

function! s:colorcolumn() abort "{{{1
  let width = &tw > 0 ? &tw + 1 : get(g:, 'pencil#textwidth', 79) + 1
  exe 'setl colorcolumn='. (width > 0 ? width : 80)
endfunction

let s:pencil = {} "{{{1

function! s:pencil.commit() abort "{{{2
  setl spell spl=en_us,cjk et sw=2 ts=2 noai
  " Note: makes too slow to open buffer
  "call pencil#init({'wrap': 'soft', 'textwidth': &tw > 0 ? &tw : 72})
endfunction

function! s:pencil.markdown() abort "{{{2
  setl spell spl=en_us,cjk
  call pencil#init({'wrap': 'soft', 'textwidth': &tw > 0 ? &tw : 79})
endfunction

function! s:pencil.html() abort "{{{2
  setl spell spl=en_us,cjk et sw=2 ts=2
  call pencil#init({'wrap': 'soft', 'textwidth': &tw > 0 ? &tw : 79})
endfunction

function! s:pencil.mail() abort "{{{2
  setl spell spl=en_us,cjk et sw=2 ts=2 noai nonu nornu
  call pencil#init({'wrap': 'soft', 'textwidth': &tw > 0 ? &tw : 60})
endfunction

