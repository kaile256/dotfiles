"""" Tig
" default keymap is <C-~~>.
let g:tig_explorer_keymap_edit    = '<space>o'
let g:tig_explorer_keymap_tabedit = '<space>t'
let g:tig_explorer_keymap_split   = '<space>s'
let g:tig_explorer_keymap_vsplit  = '<space>v'

" tig with currentfile
nnoremap <space>tc :TigOpenCurrentFile<cr>
" tig with project root path
nnoremap <space>tr :TigOpenProjectRootDir<cr>

""" Tig-Grep
nnoremap <space>tg :TigGrep<cr>
" resume the last grep
nnoremap <space>tr :TigGrepResume<cr>
" open tig grep with the word under cursor.
nnoremap <space>tk :<C-u>:TigGrep<space><C-r><C-w><cr>
vnoremap <space>tg :TigGrep<space><C-r>"<cr>

"" Tig-Blame
" tig-blame with current file.
nnoremap <space>tb :TigBlame<cr>
