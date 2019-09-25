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
" CAUTION: only recall the data of cursorline which depends on the line.
" Note: if you want to redo, just ':norm u'.
command! -nargs=0 UndoLine call chundo#undoLine()
"command! -range -nargs=0 UndoSelected call chundo#undoSelected()

nnoremap U :UndoLine<cr>
"vnoremap u :UndoSelected<cr>
"vnoremap <C-r> :call chundo#redo()<cr>

" Vim has no VisualModeEnter auto command, so we hijack a little bit to reset
" the skip count each time
nnoremap v     :call chundo#_resetCounter()<cr>v
nnoremap V     :call chundo#_resetCounter()<cr>V
nnoremap <C-v> :call chundo#_resetCounter()<cr><C-v>
