" From: browse.toml
" Repo: majutsushi/tagbar
" Another: add/tagbar.vim

let g:tagbar_iconchars = ['*', '#']
let g:tagbar_silent = 1
let g:tagbar_previewwin_pos = 'bot'

"let g:tagbar_autofocus   = 1
"let g:tagbar_autoclose   = 1

" 0: open folds only when the current tag is inside a closed fold. (default)
" 1: open folds as much as needed for the tag to be visible.
" 2: never open folds automatically.
let g:tagbar_autoshowtag = 1

" 0: sort in order of source file
" 1: sort by name (default)
"let g:tagbar_sort = 0

"let g:tagbar_compact = 1 " 0: show help introduction

let g:tagbar_indent    = 1
let g:tagbar_foldlevel = 2

"let g:tagbar_show_linenumbers = 0
"let g:tagbar_vertical = 0
let g:tagbar_width = 40

"let g:tagbar_map_previewwin =

if exists('#myTagbarSo') | au! myTagbarSo
endif
augroup myTagbarSo "{{{1
  au FileType * call s:keymaps_if_no_tags()
augroup END

function! s:keymaps_if_no_tags() abort "{{{1
  if index(['nofile', 'nowrite', 'terminal'], &bt) >= 0
    nnoremap <silent><buffer> <a-i> :<c-u>wincmd p <bar> TagbarToggle <cr>
    nnoremap <silent><buffer> <a-o> :<c-u>wincmd p <bar> TagbarToggle <cr>
  elseif index(['quickfix'], &bt) >= 0
    nnoremap <silent><buffer> <a-i> :<c-u>close <bar> wincmd p <cr>
    nnoremap <silent><buffer> <a-o> :<c-u>close <bar> wincmd p <cr>
  endif
endfunction
