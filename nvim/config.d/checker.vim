"""" KEYMAP
""" Checkhealth
if has('nvim')
  noremap  <silent> <space>ch :<c-u>checkhealth<cr>
  noremap  <silent> <a-c><a-h> :<c-u>checkhealth<cr>
  cnoremap <silent> <a-c><a-h> :<c-u>checkhealth<cr>
endif

""" Reload init.vim
noremap <space>so :<c-u>so $XDG_CONFIG_HOME/nvim/init.vim<CR>

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

