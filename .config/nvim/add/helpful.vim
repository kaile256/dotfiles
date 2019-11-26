" From: tool.toml
" Repo: tweekmonster/helpful.vim

"nnoremap <silent> gV :<c-u>call helpful#cursor_word()<cr>
"xnoremap <silent> gV :<c-u>call helpful#cursor_word()<cr>

nnoremap <silent> gV :<c-u>call helpful#lookup(expand('<cword>'))<cr>
xnoremap <silent> gV :<c-u>call helpful#lookup(expand('<cword>'))<cr>

command! -nargs=* -complete=help Version :call s:version_check(<q-args>)

function! s:version_check(args) abort
  if a:args ==# ''
    " WARNING: helpful#buffer_version() is no use at present
    call helpful#buffer_version()
  else
    call helpful#lookup(a:args)
  endif
endfunction
