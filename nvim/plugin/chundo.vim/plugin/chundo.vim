" Selective undo for Vim
" Ref: mundo.vim
" MIT licensed, please feel free to PR it and improve

" Remove Before Flight:
"if !exists('g:selective_undo_debug') && (exists('g:mundo_disable') &&
"      \ g:selective_undo_disable == 1 || exists('loaded_mundo') || &cp)"{{{
"  finish
"endif
"
"let loaded_chundo = 1"}}}

" Commands and mappings
command! -nargs=0 UndoLine call chundo#undoLine()
"command! -range -nargs=0 UndoSelected call chundo#undoSelected()

"vnoremap u :UndoSelected<cr>
" Unimplemented yet
"vnoremap <C-r> :call chundo#redo()<cr>

" Vim has no VisualModeEnter autocommand,
" so we hack a little to reset the skip count each time
nnoremap v :call chundo#resetCounter()<cr>v
nnoremap V :call chundo#resetCounter()<cr>V
nnoremap <C-v> :call chundo#resetCounter()<cr><C-v>
