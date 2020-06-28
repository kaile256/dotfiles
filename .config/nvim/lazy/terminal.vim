" From: init.vim
" Another: tmaps.vim
" Another: keymap/open_terminal.vim

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

if has('nvim')
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
else
  let g:terminal_ansi_colors = [
        \ '#2e3436',
        \ '#e73131',
        \ '#67c60c',
        \ '#ddb812',
        \ '#4383d5',
        \ '#b859c8',
        \ '#43c4cc',
        \ '#d3d7cf',
        \ '#555753',
        \ '#fc6868',
        \ '#8ae234',
        \ '#fce94f',
        \ '#729fcf',
        \ '#ad7fa8',
        \ '#00f5e9',
        \ '#eeeeec',
        \ ]
endif

augroup myTerminalLazy
  if exists('#myTerminalLazy') | au! myTerminalLazy
  endif
  " Open Terminal as Startpage
  "if @% == '' && &ft ==# '' && &bt ==# ''
  "  au VimEnter * nested call termopen(&shell)
  "endif
  exe 'au' TermOpen '* call <SID>set_opts_for_term()'
augroup END

function! s:set_opts_for_term() abort "{{{2
  " Without the check that current buffer is terminal, opening terminal
  " background like with QuickRun apply all the config on non-terminal buffer.
  if &bt !=# 'terminal' | return | endif
  setl nonumber signcolumn= bufhidden=wipe
  norm! 0
  " startinsert " Some plugin start terminal with inserting 'i'.
endfunction

"" Function; ls-grep
"function! s:grep_heavy_bufnr()
"  " TODO: get bufnr('term://') in hidden-buffers to bufdelete them.
"  let l:hidden_buffers = execute('ls!')
"  " e.g., term://foo
"  let l:only_term = substitute(l:hidden_buffers, '[^:\/\/]', '', 'e')
"  let l:only_term_bufnr = substitute(l:)
"  bwipeout g/term:\/\//
"endfunction
