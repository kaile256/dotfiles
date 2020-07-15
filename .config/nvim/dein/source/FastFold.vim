" From: default.toml
" Repo: Konfekt/FastFold
" Fork: kaile256/FastFold

let g:fastfold_fold_command_suffixes = ['v','r','R','x','X','a','A','o','O','c','C']

augroup myFastFoldSource
  " TODO: make the fold treatment work
  "au BufNew * call s:tidy_buffer() "{{{1
  "function! s:tidy_buffer() abort
  "  if line2byte('w$') < line2byte('$')
  "    norm zM
  "    if line('.') == 1
  "      let save_line = line('.')
  "      norm zj
  "    endif
  "  endif

  "  norm zv
  "  "exe exists('save_line') ? save_line : ''
  "endfunction

  "}}}1
augroup END

