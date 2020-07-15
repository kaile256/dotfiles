" From: default.toml
" Repo: simnalamburt/vim-mundo
" Another: add/mundo.vim

" TODO: ignore write state which has no change

"let g:mundo_disable = 1
let g:mundo_prefer_python3 = 1

" Note:
"   0: open __Mundo__ by 'wincmd H'; __Mundo_Preview__ in 'topleft'
"   1: open __Mundo__ by 'wincmd L'; __Mundo_Preview__ in 'botright'
let g:mundo_right = 1
let g:mundo_width = (&columns / 3)  " relative to editor's width

let g:mundo_preview_bottom = 1
let g:mundo_preview_height = (&lines /2) " relative to editor's height
let g:mundo_auto_preview_delay = 400  " default: 250ms

"let g:mundo_tree_statusline = 1
"let g:mundo_preview_statusline = 1

let g:mundo_inline_undo   = 1  " one-line preview on than full-diff.
let g:mundo_auto_preview  = 1
let g:mundo_verbose_graph = 0  " Verbose '|' between lines
let g:mundo_mirror_graph  = 1  " 1: Extend undo-branchs to left.

"let g:mundo_close_on_revert = 1  " auto close on leaving mundo-windows
"let g:mundo_return_on_revert = 0  " keep focus even after a revert; default: 1

"let g:mundo_playback_delay = 60  " delay for 'play to' mode; default: 60ms

" 'play_to': undo/redo to the selected-undo history, motionaly.
" TODO: echo 'preparing...'; too slow to show diff.
let g:mundo_mappings = {
      \ '<cr>': 'preview',
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

if exists('#myMundoSource') | au! myMundoSource
endif
augroup myMundoSource
  au FileType Mundo,MundoDiff setl signcolumn=
  au FileType Mundo setl winfixwidth
augroup END
