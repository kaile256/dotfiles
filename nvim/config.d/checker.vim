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
noremap <space>so  :<c-u>so %<CR>
noremap <a-s><a-o> :<c-u>so %<CR>
noremap <a-s>o     :<c-u>so %<CR>

"augroup CheckStartTime
"  au! VimEnter,InsertEnter,WinEnter * checktime
"augroup END

""" Grep
"augroup GrepOnQuickfix
"  au! QuickFixCmdPost * :cwindow<cr>
"augroup END

""" Git
augroup GitSpellCheck
  au! FileType gitcommit setlocal spell
augroup END

"""" QuickFix
"augroup QuickFixModifiable
"  au! QuickFixCmdPost * setlocal modifiable
"augroup END

