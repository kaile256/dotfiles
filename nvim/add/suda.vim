" From: tool.toml

"command! -bar -nargs=* -complete=file E :exe 'e' <SID>sudo_check_arg(<q-args>)
command! -bar -nargs=* -complete=file W :exe 'w' <SID>sudo_check_arg(<q-args>)
command! -bar -nargs=* -complete=file R :exe 'r' <SID>sudo_check_arg(<q-args>)

"command! -bar -nargs=+ -complete=file Yay :call suda#system('yay', <q-args>)
command! -bar -nargs=+ -complete=file Sudo :call suda#system('sudo', <q-args>)

function! s:sudo_check_arg(path) abort
  if empty(a:path)
    return 'suda://%'
  else
    return 'suda://' . fnameescape(a:path)
  endif
endfunction
