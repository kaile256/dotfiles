"""" From: nvim/init.vim

"""" KEYMAP
augroup AppendFileType
  au!
  au BufNewFile,BufRead *.vim!   setlocal filetype=vim
  au BufNewFile,BufRead *.vimrc  setlocal filetype=vim
  au BufNewFile,BufRead *.vimrc! setlocal filetype=vim
  au BufNewFile,BufRead i3/*/config setlocal filetype=i3
augroup END

augroup OnTermMode
  au!
  au TermOpen * silent setlocal nonumber
  au TermOpen,BufEnter * if &buftype ==# 'terminal' | startinsert | endif
augroup END

augroup NoBufListed
"  au!
  " Why: setlocal buflisted DOESN'T work.
"  au WinLeave * if &filetype ==# 'netrw' | bd <c-r>=bufnr('%')
augroup END

augroup AdjustOnFileType
  """ Treat as QuickFix
  au FileType help setlocal buftype=quickfix
  "" Cursor Locates on the Middle
  au FileType help norm zz

  """" PLUGINS
  """ Treat as QuickFix
  """ Help in Buffer-list
  au BufLeave * if &filetype ==# 'help' | drop % | endif
  au FileType netrw,gitcommit,fugitive,defx,vista setlocal buftype=quickfix
  " upon setting filetype=quickfix, vim demands write before quit.
  au FileType vista setlocal nobuflisted

  """ Quit immediately upon WinLeave
  "" NOTICE: fzf works on terminal; CANNOT change buftype.
  au WinLeave * if &filetype ==# 'fzf' | quit | endif
augroup END

augroup RemapJumpOnQuickFix
  au!
  au FileType qt,fugitive call s:quickfix_keymap()
augroup END

function! s:quickfix_keymap() abort
  nnoremap <buffer> <c-p> :cprevious<cr>
  nnoremap <buffer> <c-n> :cnext<cr>
  nnoremap <buffer> <a-]> :cnewer<cr>
  nnoremap <buffer> <a-[> :colder<cr>
endfunction
