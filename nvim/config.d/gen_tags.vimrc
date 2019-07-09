" auto-generate tags.
let g:gen_tags#ctags_auto_gen = 1
let g:gen_tags#gtags_auto_gen = 1

nnoremap <a-c> :GenCtags<cr>
nnoremap <a-g> :GenGTAGS<cr>
