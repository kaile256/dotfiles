"""" From: nvim/init.vim

"""" GENERAL
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
"  au TermOpen,BufEnter * if &buftype ==# 'terminal' && &filetype !=# 'help' | setlocal nobuflisted | endif
augroup END

augroup AdjustOnFileType
  au BufEnter * if &filetype !=# 'vim' | call s:ft_is_not_vim() | endif
  "" Cursor Locates on the Middle
  au FileType help norm zz

  """ Append Help on Buffer-list
  au BufLeave * if &filetype ==# 'help' | drop % | endif

  """ Treat as QuickFix
  au FileType help,netrw,git,gitcommit,fugitive,denite,defx setlocal buftype=quickfix

  """ Quit immediately upon WinLeave
  "" NOTICE: fzf works on terminal; CANNOT change buftype.
  au WinLeave * if &filetype ==# 'fzf' | quit | endif

  au FileType qt,fugitive call s:quickfix_keymap()
augroup END

"""" DEFINITION
function! s:quickfix_keymap() abort
  nnoremap <buffer> <c-p> :cprevious<cr>
  nnoremap <buffer> <c-n> :cnext<cr>
  nnoremap <buffer> <a-]> :cnewer<cr>
  nnoremap <buffer> <a-[> :colder<cr>
endfunction

function! s:ft_is_not_vim() abort
  nnoremap <buffer> <a-s><a-o> :echo '&filetype is not "vim"!'<cr>
  nnoremap <buffer> <a-s>o     :echo '&filetype is not "vim"!'<cr>
endfunction

  """" KEYMAP
  "augroup CheckStartTime
  "  au! VimEnter,InsertEnter,WinEnter * checktime
  "augroup END

  """ Reload init.vim
  nnoremap <a-s><a-o> :<c-u>so % <bar> echo ' Vim sourced "' . bufname('%') . '"'<CR>
  nnoremap <a-s>o     :<c-u>so % <bar> echo ' Vim sourced "' . bufname('%') . '"'<CR>

  """ Mnemonic: Show BufType/FileType
  nnoremap <a-s><a-b> :echo ' &filetype is "' . &filetype . '"; &buftype is "' . &buftype . '"'<cr>
  nnoremap <a-s><a-f> :echo ' &filetype is "' . &filetype . '"; &buftype is "' . &buftype . '"'<cr>
  "nnoremap <a-s><a-b> :echo " &filetype is '" . &filetype . "'; &buftype is '" . &buftype . "'"<cr>
  "nnoremap <a-s><a-f> :echo " &filetype is '" . &filetype . "'; &buftype is '" . &buftype . "'"<cr>

  """ Checkhealth
  if has('nvim')
    nnoremap <silent> <a-c><a-h> :<c-u>checkhealth<cr>:setlocal buftype=quickfix<cr>
    nnoremap <silent> <a-c>h     :<c-u>checkhealth<cr>:setlocal buftype=quickfix<cr>
    cnoremap <silent> <a-c><a-h> :<c-u>checkhealth<cr>:setlocal buftype=quickfix<cr>
    cnoremap <silent> <a-c>h     :<c-u>checkhealth<cr>:setlocal buftype=quickfix<cr>
  endif

