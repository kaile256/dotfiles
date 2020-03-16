" From: motion.toml
" Repo: terryma/vim-multiple-cursors

let g:multi_cursor_use_default_mapping = 0

" Note: g:multi_cursor_quit_key will quit and delete all cursors in the mode,
"       skipping normal mode with multiple cursors.
let g:multi_cursor_exit_from_visual_mode = 1
let g:multi_cursor_exit_from_insert_mode = 1

" TODO: make the plugin's map as in another mode.
"xmap s <Plug>(multiple-cursors-new-word)
xmap s <Plug>(multiple-cursors-new)

"let g:multi_cursor_start_word_key      = 's'
xnoremap <silent> s :<C-u>call multiple_cursors#new("v", 0)<CR>
"let g:multi_cursor_start_key           = 'S'
"xnoremap <silent> S :<C-u>call multiple_cursors#new("v", 0)<CR>
""let g:multi_cursor_select_all_word_key = 'm'
"xnoremap <silent> ms  :<C-u>call multiple_cursors#select_all("v", 0)<CR>
""let g:multi_cursor_select_all_key      = 'M'
"xnoremap <silent> mS :<C-u>call multiple_cursors#select_all("v", 0)<CR>

"let g:multi_cursor_prev_key            = '<a-o>'
"let g:multi_cursor_next_key            = '<a-i>'
"let g:multi_cursor_skip_key            = '<a-i>'
"let g:multi_cursor_quit_key            = '<Esc>'

let g:multi_cursor_normal_maps = {
      \ 'F': 1, 'f': 1, 'T': 1, 't': 1,
      \ 'y': 1, 'd': 1, 'c': 1,
      \ '<': 1, '=': 1, '>': 1,
      \ 'z': 1, '!': 1, 'r': 1,
      \ 'q': 1, '@': 1,
      \ 'g': 1, 'm': 1, '"': 1,
      \ '[': 1, ']': 1, '\': 1,
      \ }

let g:multi_cursor_visual_maps = {
      \ 'F': 1, 'f': 1, 'T': 1, 't': 1,
      \ 'i': 1, 'a': 1,
      \ }
