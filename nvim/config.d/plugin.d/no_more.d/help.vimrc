augroup HelpConfig
  au FileType help :nnoremap <buffer><silent> <c-m> :<c-r>= (line('w$') + line('w0') + 2*line('.'))/4<cr><cr>
augroup END
