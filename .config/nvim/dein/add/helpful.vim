" From: tool.toml
" Repo: tweekmonster/helpful.vim

"nnoremap <silent> gV :<c-u>call helpful#cursor_word()<cr>
"xnoremap <silent> gV :<c-u>call helpful#cursor_word()<cr>

" Mnemonic: Get the Version of Vim
nnoremap <silent> gV :<c-u>call helpful#lookup(expand('<cword>'))<cr>
xnoremap <silent> gV :<c-u>call helpful#lookup(expand('<cword>'))<cr>

command! -nargs=* -complete=help Version :call s:version_check(<q-args>)

function! s:version_check(args) abort
  if a:args ==# ''
    let save_eventignore = &eventignore
    set eventignore+=TextYankPost
    " WARNING: helpful#buffer_version() seems no use at present
    call helpful#buffer_version()
    let &eventignore = save_eventignore
  else
    call helpful#lookup(a:args)
  endif
endfunction
