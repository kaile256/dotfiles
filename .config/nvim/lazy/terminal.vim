" From: init.vim
" Another: tmaps.vim

"" Even as a startpage, startinsert {{{1
"setl nonumber signcolumn= bufhidden=wipe
"norm! 0
"startinsert | finish

if &bt ==# 'terminal'
  nnoremap <buffer> o i

  nnoremap <buffer> d <c-d>
  nnoremap <buffer> u <c-u>

  nnoremap <buffer> D <c-f>
  nnoremap <buffer> U <c-b>
endif

" As a startpage, not startinsert {{{1
if get(g:, 'loaded_lazy_terminal', 0) | finish | endif
" Note: cannot use ++once to detect &bt in if-sentence
let g:loaded_lazy_terminal = 1

" TODO: find colorscheme for floating window's cool, transpaent color.
let g:terminal_color_0  = '#2e3436'
let g:terminal_color_1  = '#e73131'
let g:terminal_color_2  = '#67c60c'
let g:terminal_color_3  = '#ddb812'
let g:terminal_color_4  = '#4383d5'
let g:terminal_color_5  = '#b859c8'
let g:terminal_color_6  = '#43c4cc'
let g:terminal_color_7  = '#d3d7cf'
let g:terminal_color_8  = '#555753'
let g:terminal_color_9  = '#fc6868'
let g:terminal_color_10 = '#8ae234'
let g:terminal_color_11 = '#fce94f'
let g:terminal_color_12 = '#729fcf'
let g:terminal_color_13 = '#ad7fa8'
let g:terminal_color_14 = '#00f5e9'
let g:terminal_color_15 = '#eeeeec'

augroup myTerminalLazy
  if exists('#myTerminalLazy')
    au! myTerminalLazy
  endif
  " Open Terminal as Startpage
  "if @% == '' && &ft ==# '' && &bt ==# ''
  "  au VimEnter * nested call termopen(&shell)
  "endif
  exe 'au' $TermOpen '* setl nonumber signcolumn= bufhidden=wipe'
  exe 'au' $TermOpen '* norm! 0'
  exe 'au' $TermOpen '* startinsert'
augroup END

"" Function; ls-grep
"function! s:grep_heavy_bufnr()
"  " TODO: get bufnr('term://') in hidden-buffers to bufdelete them.
"  let l:hidden_buffers = execute('ls!')
"  " e.g., term://foo
"  let l:only_term = substitute(l:hidden_buffers, '[^:\/\/]', '', 'e')
"  let l:only_term_bufnr = substitute(l:)
"  bwipeout g/term:\/\//
"endfunction
