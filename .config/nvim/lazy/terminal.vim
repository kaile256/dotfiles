" From: init.vim

"" Even as a startpage, startinsert {{{1
"setl nonumber signcolumn= bufhidden=wipe
"norm! 0
"startinsert | finish

if &bt ==# 'terminal'
  nnoremap <buffer> d <c-d>
  nnoremap <buffer> u <c-u>
endif

" As a startpage, not startinsert {{{1
if get(g:, 'loaded_lazy_terminal', 0) | finish | endif
" Note: cannot use ++once to detect &bt in if-sentence
let g:loaded_lazy_terminal = 1

augroup OnTerminalBuffer
  au!
  " Open Terminal as Startpage
  "if @% == '' && &ft ==# '' && &bt ==# ''
  "  au VimEnter * nested call termopen(&shell)
  "endif
  if has('nvim')
    au TermOpen * setl nonumber signcolumn= bufhidden=wipe
    au TermOpen * norm! 0
    au TermOpen * startinsert
  endif
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
