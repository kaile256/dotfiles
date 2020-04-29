" From: memo.toml
" Repo: dhruvasagar/vim-table-mode
" Another: source/table-mode.vim

"let g:table_mode_disable_mappings = 1

let g:table_mode_motion_up_map = 'mk'
let g:table_mode_motion_down_map = 'mj'
let g:table_mode_motion_left_map = 'mh'
let g:table_mode_motion_right_map = 'ml'

let g:table_mode_cell_text_object_a_map = 'am'
let g:table_mode_cell_text_object_i_map = 'im'

let g:table_mode_realign_map = '<Nop>'
let g:table_mode_delete_row_map = '<Nop>'
let g:table_mode_delete_column_map = '<Nop>'
let g:table_mode_add_formula_map = '<Nop>'
let g:table_mode_eval_formula_map = '<Nop>'
let g:table_mode_echo_cell_map = '<Nop>'
let g:table_mode_sort_map = '<Nop>'

" Ref: see default values for g:var in dhruvasagar/vim-table-mode/plugin/table-mode.vim @17
" augroup myTableModeSource
"   if exists('#myTableModeSource') | au! myTableModeSource | endif
"   " au BufRead *.{wiki,md,org,txt} TableModeEnable
"   au InsertLeave *.{wiki,md,org,txt} TableModeRealign
"   " Note: some functions would not work if disabled on `InsertLeave`
"   "au InsertLeave *.{wiki,md,org,txt} silent TableModeDisable
" augroup END
