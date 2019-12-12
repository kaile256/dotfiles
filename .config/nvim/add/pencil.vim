" From: insert.toml
" Repo: reedes/vim-pencil
" Another: post/pencil.vim

" Note: 'colorcolumn' fails to work this plugin
let g:pencil#wrapModeDefault = 'soft'   " default: 'hard'

"let g:pencil#autoformat = 0      " 0=disable, 1=enable (def)

let s:pencil = {}

function! s:pencil.markdown() abort "{{{1
  setl spell spl=en_us,cjk fdl=4 noru nonu nornu
  setl fdo+=search
  call pencil#init()
endfunction

function! s:pencil.commit() abort "{{{1
  setl spell spl=en_us,cjk et sw=2 ts=2 noai
  call pencil#init({'wrap': 'soft', 'textwidth': 72})
endfunction

function! s:pencil.mail() abort "{{{1
  setl spell spl=en_us,cjk et sw=2 ts=2 noai nonu nornu
  call pencil#init({'wrap': 'hard', 'textwidth': 60})
endfunction

function! s:pencil.html() abort "{{{1
  setl spell spl=en_us,cjk et sw=2 ts=2
  call pencil#init({'wrap': 'soft'})
endfunction

augroup myPencil
  aut!
  au FileType markdown,mkd call s:pencil.markdown()
  au Filetype git,gitsendemail,*commit*,*COMMIT* call s:pencil.commit()
  au Filetype mail         call s:pencil.mail()
  au Filetype html,xml     call s:pencil.html()
augroup END
