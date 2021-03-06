" From: tool.toml
" Repo: mattn/vim-findroot

function! s:hub_create(path, ...) abort
  " TODO: distinguish flag and path
  if a:path ==# '.'
    FindRoot
    let dir_path = execute('pwd')
  endif
  let flags = join(get(a:, '000', []))
  exe '!hub create' flags dir_path
endfunction

command! -nargs=* -complete=dir HubCreatePrivate call s:hub_create(<f-args>, '-p')
