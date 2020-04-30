" From: fugitive.toml
" Repo: rhysd/committia.vim
" Help: rhysd/committia.vim/README.md

let g:committia_hooks = {}
" edit_open
" status_open
" diff_open

"   KEY (info)       VALUE                      AVAILABILITY
"-----------------------------------------------------------------------------------
"   vcs            : vcs type (e.g. 'git')   -> all hooks
"   edit_winnr     : winnr of edit window    -> ditto
"   edit_bufnr     : bufnr of edit window    -> ditto
"   diff_winnr     : winnr of diff window    -> ditto
"   diff_bufnr     : bufnr of diff window    -> ditto
"   status_winnr   : winnr of status window  -> all hooks except for 'diff_open' hook
"   status_bufnr   : bufnr of status window  -> ditto
"
function! g:committia_hooks.status_open(info) "{{{
  " Scroll the diff window from insert mode
  imap <buffer><C-n> <Plug>(committia-scroll-diff-down-half)
  imap <buffer><C-p> <Plug>(committia-scroll-diff-up-half)
endfunction "}}}

function! g:committia_hooks.edit_open(info) "{{{
  "Additional settings
  setl spell
  " If no commit message, start with insert mode
  " Scroll the diff window from insert mode
  imap <buffer><C-n> <Plug>(committia-scroll-diff-down-half)
  imap <buffer><C-p> <Plug>(committia-scroll-diff-up-half)
endfunction "}}}

function! g:committia_hooks.diff_open(info) "{{{
  "Additional settings
  setl spell
  " If no commit message, start with insert mode
  if a:info.vcs ==# 'git'
  endif
endfunction "}}}

augroup CallCommittiaFunction
  au!
  "au FileType    fugitive  call g:committia_hooks.status_open('git')
  "au FileType    gitcommit call g:committia_hooks.edit_open('git')
  "au BufWinEnter *         call g:committia_hooks.diff_open('git')
augroup END

"" Options {{{
"<Plug>(committia-scroll-diff-down-half)
"<Plug>(committia-scroll-diff-up-half)
"<Plug>(committia-scroll-diff-down-page)
"<Plug>(committia-scroll-diff-up-page)

" default: 1
" 0: always attempts to open committia's buffer with a COMMIT_EDITMSG buffer.
" With vim-fugitive, '1' is recommended
"let g:committia_open_only_vim_starting = 0

" default: 'fallback'
" 'always': always employs single column mode.
"let g:committia_use_singlecolumn = 'always'

" default: 160
" employ single column mode if the width of window is narrower than the value.
"let g:committia_min_window_width

" default: 'belowright split'
" Vim command to open a status window in multi-columns mode.
"let g:committia_status_window_opencmd

" default: 'botright vsplit'
" Vim command to open a diff window in multi-columns mode.
"let g:committia_diff_window_opencmd

" default: 'belowright split'
" Vim command to open a diff window in single-column mode.
"let g:committia_singlecolumn_diff_window_opencmd
""}}}
