" TOML: vimscript.toml
" Repo: mattn/benchvimrc-vim

comman! -nargs=? -complete=file BenchVimrcWrap :call s:benchvimrc(<q-args>)

function! s:benchvimrc(target) abort
  let bufnr = bufnr('__BENCHVIMRC__')
  if bufnr != -1
    let path = bufname(bufnr)
    call delete(path)
  endif

  let target = a:target ==# '' ? '%:p' : a:target
  try
    silent! exe 'silent! BenchVimrc' target
  catch /E95/
    setlocal syn=vim
  endtry
endfunction
