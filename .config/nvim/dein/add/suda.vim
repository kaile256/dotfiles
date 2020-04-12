" From: shell.toml
" Repo: lambdalisue/suda.vim

"command! -bar -nargs=* -complete=file E :exe 'e' s:sudo_check_arg(<q-args>)
command! -bar -nargs=* -complete=file W :call s:sudo_write(<q-args>)
" command! -bar -nargs=* -complete=file R :call s:sudo_read(<q-args>)

" Fixme: no response on :Yay, just prompted the password.
command! -bar -nargs=+ -complete=file Yay  :call suda#system('yay <args>')
command! -bar -nargs=+ -complete=file Sudo :call suda#system(<q-args>)

function! s:sudo_write(path) abort
  let path = empty(a:path) ? '%:p' : fnameescape(a:path)
  try
    " write as simply `:w`
    exe 'w' path
  catch
    exe 'w suda://'. path
  endtry
endfunction
