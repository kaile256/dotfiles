" From: shell.toml
" Repo: lambdalisue/suda.vim

"command! -bar -nargs=* -complete=file E :exe 'e' s:sudo_check_arg(<q-args>)
command! -bar -nargs=* -complete=file W :exe 'w' s:sudo_check_arg(<q-args>)
command! -bar -nargs=* -complete=file R :exe 'r' s:sudo_check_arg(<q-args>)

" Fixme: no response on :Yay, just prompted the password.
"command! -bar -nargs=+ -complete=file Yay :call suda#system('yay', <q-args>)
command! -bar -nargs=+ -complete=file Sudo :call suda#system('sudo', <q-args>)

function! s:sudo_check_arg(path) abort
  if empty(a:path)
    return 'suda://%'
  else
    return 'suda://' . fnameescape(a:path)
  endif
endfunction
