"let g:vista_icon_indent = ["╰▸ ", "├▸ "]
"let g:vista_default_executive = 'ctags'
"let g:vista_fzf_preview = ['right:50%']
"let g:vista#renderer#enable_icon = 1
"let g:vista#renderer#icons = {
"      \   "function": "\uf794",
"      \   "variable": "\uf71b",
"      \  }

nnoremap <silent> <a-;> :<c-u>Vista<cr>
nnoremap <silent> <c-;> :<c-u>Vista coc<cr>

nnoremap <silent> <a-s> :<c-u>Vista show<cr>
nnoremap <silent> <a-t> :<c-u>Vista toc<cr>

nnoremap <silent> <a-f> :<c-u>Vista finder<cr>
nnoremap <silent> <a-c> :<c-u>Vista finder coc<cr>
