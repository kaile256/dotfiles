" From: tool.toml
" Repo: tweekmonster/helpful.vim

"nnoremap <silent> gV :<c-u>call helpful#cursor_word()<cr>
"xnoremap <silent> gV :<c-u>call helpful#cursor_word()<cr>

" Mnemonic: Get the Version of Vim
nnoremap <silent> gV :<c-u>call helpful#lookup(expand('<cword>'))<cr>
xnoremap <silent> gV :<c-u>call helpful#lookup(expand('<cword>'))<cr>

command! -nargs=* -complete=help Ver     :call s:version_check(<q-args>)
command! -nargs=* -complete=help Version :call s:version_check(<q-args>)

function! s:version_check(args) abort
  const args = substitute(a:args, '@\l\l', '', '')

  if args !=# ''
    call helpful#lookup(args)
    return
  endif

  let save_eventignore = &eventignore
  set eventignore+=TextYankPost
  " WARNING: helpful#buffer_version() seems no use at present
  call helpful#buffer_version()
  let &eventignore = save_eventignore
endfunction
