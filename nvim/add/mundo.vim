" From: tool.toml
" Repo: simnalamburt/vim-mundo

" Keymap; Hotkey
nnoremap <silent> <space>u <Cmd>MundoToggle<cr>

let g:mundo_right = 1
let g:mundo_width = &columns /2  " relative to editor's width
"let g:mundo_disable = 1
"let g:mundo_close_on_revert = 1  " auto close on leaving mundo-windows
"let g:mundo_return_on_revert = 0  " keep focus even after a revert; default: 1

let g:mundo_verbose_graph = 0  " Verbose '|' between lines
let g:mundo_mirror_graph = 1  " 1: Extend undo-branchs to left.
"let g:mundo_playback_delay = 60  " delay for 'play to' mode; default: 60ms
let g:mundo_inline_undo = 1  " one-line preview on than full-diff.
let g:mundo_auto_preview = 0
"let g:mundo_auto_preview_delay = 250  " default: 250ms
"let g:mundo_preview_statusline = 1
"let g:mundo_tree_statusline = 1
let g:mundo_preview_bottom = 1
let g:mundo_preview_height = &lines " relative to editor's height

" 'play_to': undo/redo to the selected-undo history, motionaly.
" TODO: echo 'preparing...'; too slow to show diff.
let g:mundo_mappings = {
          \ '<CR>': 'preview',
          \ 'j': 'move_older',
          \ 'k': 'move_newer',
          \ 'zj': 'move_older_write',
          \ 'zk': 'move_newer_write',
          \ 'gg': 'move_top',
          \ 'G': 'move_bottom',
          \ 'P': 'play_to',
          \ 'D': 'diff',
          \ '/': 'search',
          \ 'n': 'next_match',
          \ 'N': 'previous_match',
          \ 'd': 'diff_current_buffer',
          \ 'p': 'diff_current_buffer',
          \ '?': 'toggle_help',
          \ }

augroup MyMundoConf
  au!
  au FileType Mundo,MundoDiff setl signcolumn=
augroup END
