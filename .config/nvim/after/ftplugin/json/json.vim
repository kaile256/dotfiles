" From: filetype.vim

" Ref: /usr/share/nvim/runtime/syntax/json.vim
"let g:vim_json_syntax_conceal = 0
"
setlocal conceallevel=0

augroup myJsonFtplugin
  if exists('#myJsonFtplugin') | au! myJsonFtplugin
  endif
  au InsertLeave json call s:json_format()
augroup END

function! s:json_format() abort
  keeppatterns s/":"/": "/g

  if getline('.') =~# '"'
    .-1 s/"$/",/
  endif
endfunction

