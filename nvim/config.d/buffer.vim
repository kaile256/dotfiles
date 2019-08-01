"""" From: nvim/init.vim

"""" KEYMAP
""" Mnemonic: Show BufType/FileType
nnoremap <a-s><a-b> :echo ' &filetype is "' . &filetype . '"; &buftype is "' . &buftype '"'<cr>
nnoremap <a-s><a-f> :echo ' &filetype is "' . &filetype . '"; &buftype is "' . &buftype '"'<cr>
"nnoremap <a-s><a-b> :echo " &filetype is '" . &filetype . "'; &buftype is '" . &buftype "'"<cr>
"nnoremap <a-s><a-f> :echo " &filetype is '" . &filetype . "'; &buftype is '" . &buftype "'"<cr>

augroup AppendFileType
  au!
  au BufNewFile,BufRead *.vim!   setlocal filetype=vim
  au BufNewFile,BufRead *.vimrc  setlocal filetype=vim
  au BufNewFile,BufRead *.vimrc! setlocal filetype=vim
  au BufNewFile,BufRead */i3/*   setlocal filetype=i3
augroup END

augroup NoBufListed
"  au!
  " Why: setlocal buflisted DOESN'T work.
"  au WinLeave * if &filetype ==# 'netrw' | bd <c-r>=bufnr('%')
augroup END

augroup AdjustOnFileType
  au!
  au FileType fugitive setlocal buftype=quickfix
  au BufLeave * if &filetype ==# 'help' | drop % | endif
  " fzf works on terminal; CANNOT change buftype.
  au WinLeave * if &filetype ==# 'fzf' | quit | endif
augroup END

""" Buffer
"augroup HelpIntoBufferList
"  "au! BufReadPost help drop %
"  au! BufReadPost * if &buftype ==# 'help' | drop % | endif
"augroup END

