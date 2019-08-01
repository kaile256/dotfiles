"""" KEYMAP
""" Checkhealth
if has('nvim')
  nnoremap <silent> <space>ch  :<c-u>checkhealth<cr>
  nnoremap <silent> <a-c><a-h> :<c-u>checkhealth<cr>
  nnoremap <silent> <a-c>h     :<c-u>checkhealth<cr>
  cnoremap <silent> <a-c><a-h> :<c-u>checkhealth<cr>
  cnoremap <silent> <a-c>h     :<c-u>checkhealth<cr>
endif

""" Reload init.vim
nnoremap <a-s><a-o> :<c-u>so % <bar> echo ' Vim sourced "' . bufname('%') . '"'<CR>
nnoremap <a-s>o     :<c-u>so % <bar> echo ' Vim sourced "' . bufname('%') . '"'<CR>

""" Mnemonic: Show BufType/FileType
nnoremap <a-s><a-b> :echo ' &filetype is "' . &filetype . '"; &buftype is "' . &buftype . '"'<cr>
nnoremap <a-s><a-f> :echo ' &filetype is "' . &filetype . '"; &buftype is "' . &buftype . '"'<cr>
"nnoremap <a-s><a-b> :echo " &filetype is '" . &filetype . "'; &buftype is '" . &buftype . "'"<cr>
"nnoremap <a-s><a-f> :echo " &filetype is '" . &filetype . "'; &buftype is '" . &buftype . "'"<cr>

"augroup CheckStartTime
"  au! VimEnter,InsertEnter,WinEnter * checktime
"augroup END

""" Grep
"augroup GrepOnQuickfix
"  au! QuickFixCmdPost * :cwindow<cr>
"augroup END

"""" QuickFix
"augroup QuickFixModifiable
"  au! QuickFixCmdPost * setlocal modifiable
"augroup END

