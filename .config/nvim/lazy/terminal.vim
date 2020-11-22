" From: init.vim
" Another: tmaps.vim
" Another: keymap/open_terminal.vim

if &bt !=# 'terminal' | finish | endif

augroup myTerminalLazy
  au!
  " Open Terminal as Startpage
  "if @% == '' && &ft ==# '' && &bt ==# ''
  "  au VimEnter * nested call termopen(&shell)
  "endif
  exe 'au' TermOpen '* call <SID>set_opts_for_term()'
  if !has('nvim')
    function! s:termopen_via_path() abort
      " Inspired by https://qiita.com/gorilla0513/items/0b0a30a6d5006515ae4d
      let cmd = matchstr(bufname(), 'term:\/\/\zs.*')
      exe 'term ++curwin ++close ++shell'
            \ (len(cmd) == 0 ? $SHELL : cmd)
    endfunction
    au BufReadCmd term://* call s:termopen_via_path()
  endif
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
