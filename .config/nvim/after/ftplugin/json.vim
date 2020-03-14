" From: filetype.vim

" Ref: /usr/share/nvim/runtime/syntax/json.vim
"let g:vim_json_syntax_conceal = 0
"
"" `conceallevel` is local to window
"setl conceallevel=0
setl fdm=syntax fdl=2
"setl noexpandtab

augroup JsonAutoAdjustment
  au!
  au InsertLeave json call s:json_format()
augroup END

if exists('g:loaded_functions_json') | finish | endif
let g:loaded_functions_json = 1

function! s:json_format() abort
  keeppatterns s/":"/": "/g

  if getline('.') =~# '"'
    .-1 s/"$/",/
  endif
endfunction
