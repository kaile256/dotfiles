" Without the check that current buffer is terminal, opening terminal
" background like with QuickRun apply all the config on non-terminal buffer.
if &bt !=# 'terminal' | finish | endif

setlocal titlestring=%{matchstr(expand('%:p'),'\\S*')}

setlocal nonumber signcolumn= bufhidden=wipe

norm! 0
" startinsert " Some plugin start terminal with inserting 'i'.

augroup myTerminalLazy
  au!
  " Open Terminal as Startpage
  "if @% == '' && &ft ==# '' && &bt ==# ''
  "  au VimEnter * nested call termopen(&shell)
  "endif
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
