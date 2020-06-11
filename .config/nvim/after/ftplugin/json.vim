" From: filetype.vim

" Ref: /usr/share/nvim/runtime/syntax/json.vim
"let g:vim_json_syntax_conceal = 0
"
setlocal conceallevel=0
setlocal fdl=0 fdm=expr fde=JsonFoldExpr(v:lnum)

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

let s:start_of_block = '\%[//].*[\[{]$'
let s:end_of_block = '\(".*\)\@<![\]}],\=$'
let s:blank_line = '^\s*$'

function! JsonFoldExpr(lnum) abort
  let line = getline(a:lnum)
  let next = getline(a:lnum + 1)
  let prev = getline(a:lnum - 1)

  if line =~# s:start_of_block
    " The first line equals to 0.
    return 'a'. (line(a:lnum) == 0 ? 1 : ((prev =~# s:blank_line) + 1))
  elseif line =~# s:end_of_block
    return 's'. (1 + (next =~# s:blank_line))
  endif

  if prev =~# s:blank_line && next !~# s:blank_line
    return 'a1'

    " elseif next =~# s:blank_line && prev !~# s:blank_line
    "   return 's1'
  elseif line =~# s:blank_line
        \ && next !~# s:blank_line && prev !~# s:blank_line
    return 's1'
  endif

  return '='
endfunction
