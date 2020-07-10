" TOML: shell.toml
" Repo: Shougo/deol.nvim
" Another: add/deol.vim
" Another: source/deol.vim

command! -nargs=* -range -bar -complete=customlist,deol#_complete
      \ Deol call s:deol(<q-args>)

function! s:deol(args) abort
  let args = a:args
  if args !~# '-cwd='
    let cwd = '-cwd='. fnamemodify(expand('%'), ':p:h')
    let args .= ' '. cwd
  endif

  let args .= ' fish'
  " if args !~# '-edit'
  "   let args .= ' -edit'
  " endif

  call deol#start(args)
endfunction

