" From: tool.toml
" Repo: https://github.com/rhysd/committia.vim
" Help: None

let g:committia_hooks = {}

function! g:committia_hooks.edit_open(info)
  "Additional settings
  setlocal spell

  " If no commit message, start with insert mode
  if a:info.vcs ==# 'git' && getline(1) ==# ''
    startinsert
  endif

  " Scroll the diff window from insert mode
  " Map <C-n> and <C-p>
  imap <buffer><C-n>
  <Plug>(committia-scroll-diff-down-half)
  imap <buffer><C-p>
  <Plug>(committia-scroll-diff-up-half)
endfunction

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
