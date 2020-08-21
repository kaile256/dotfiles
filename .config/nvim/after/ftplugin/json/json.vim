" From: filetype.vim

" Ref: /usr/share/nvim/runtime/syntax/json.vim
"let g:vim_json_syntax_conceal = 0

if fnamemodify(@%, ':p') =~# 'vimspector' && &ft ==# 'json'
  hi! link jsonCommentError Comment
  setlocal commentstring=//%s
  setlocal ft=jsonc
endif

setlocal conceallevel=0

augroup myJsonFtplugin
  au!
  au InsertLeave json call s:json_format()
augroup END

function! s:json_format() abort
  keeppatterns s/":"/": "/g

  if getline('.') =~# '"'
    .-1 s/"$/",/
  endif
endfunction

