"""" Tig
" default keymap is <C-~~>.
let g:tig_explorer_keymap_edit    = '<space>o'
let g:tig_explorer_keymap_tabedit = '<space>t'
let g:tig_explorer_keymap_split   = '<space>s'
let g:tig_explorer_keymap_vsplit  = '<space>v'

" tig with currentfile
nnoremap <space>tc :<c-u>TigOpenCurrentFile<cr>
" tig with project root path
nnoremap <space>tr :<c-u>TigOpenProjectRootDir<cr>

""" Tig-Grep
nnoremap <space>tg :<c-u>TigGrep<cr>
" resume the last grep
nnoremap <space>tr :<c-u>TigGrepResume<cr>
" open tig grep with the word under cursor.
nnoremap <space>tk :<c-u>TigGrep<space><C-r><C-w><cr>
vnoremap <space>tg :<c-u>TigGrep<space><C-r>"<cr>

"" Tig-Blame
" tig-blame with current file.
nnoremap <space>tb :<c-u>TigBlame<cr>
