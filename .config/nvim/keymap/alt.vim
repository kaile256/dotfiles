" TOML: browse.toml
" Repo: uptech/alt

"let $PATH .= g:dein_github_dir .'/uptech/alt'

function! s:alt(open, path) abort
  let alternate = system('alt '. a:path)
  if empty(alternate)
    echohl ErrorMsg
    echo expand('<sfile>') .':'
          \ 'No alternate file for "'. fnamemodify(a:path, ':t') .'" exists!'
    echohl Normal
    return
  endif

  exe a:open alternate
endfunction

nnoremap <silent> ga :<c-u>call <SID>alt('e', expand('%:p'))<cr>
nnoremap <silent> gA :<c-u>call <SID>alt('sp', expand('%:p'))<cr>
nnoremap <silent> <c-w>a :<c-u>call <SID>alt('sp', expand('%:p'))<cr>
nnoremap <silent> <c-w>A :<c-u>call <SID>alt('tabe', expand('%:p'))<cr>
nnoremap <silent> <c-w><space>a :<c-u>call <SID>alt('vs', expand('%:p'))<cr>
