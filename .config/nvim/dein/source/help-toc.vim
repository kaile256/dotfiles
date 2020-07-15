" From: myplug.toml
" Repo: kaile256/vim-help-toc

if exists('#myHelpTocSource') | au! myHelpTocSource
endif
augroup myHelpTocSource
  au FileType help,man call s:help_keymaps()
augroup END

function! s:help_keymaps() abort
  nnoremap <silent><buffer><nowait> <a-i> :<c-u>HelpTOC<cr>
  nnoremap <silent><buffer><nowait> <a-o> :<c-u>HelpTOC<cr><c-w>p
endfunction
