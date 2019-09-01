" From: tool.toml
" Repo: Shougo/defx.nvim

"" Defx-Icons {{{
" Note: defx-icons collapses i3 or qt.
"let g:defx_icons_enable_syntax_highlight = 1
"let g:defx_icons_column_length = 2
"let g:defx_icons_directory_icon = ''
"let g:defx_icons_directory_icon = ''
"let g:defx_icons_mark_icon = '*'
"let g:defx_icons_parent_icon = ''
"let g:defx_icons_default_icon = ''
"let g:defx_icons_directory_symlink_icon = ''
" Options below are applicable only when using "tree" feature
" let g:defx_icons_root_opened_tree_icon = ''
" let g:defx_icons_nested_opened_tree_icon = ''
" let g:defx_icons_nested_closed_tree_icon = ''
""}}}
" call defx#custom() {{{
call defx#custom#column('mark', {
      \ 'readonly_icon': '✗',
      \ 'selected_icon': '✓',
      \ })
call defx#custom#option('_', {
      \ 'columns': 'mark:indent:git:icons:filename:size:time',
      \ 'show_ignored_files': 1,
      \ })
call defx#custom#column('filename', {
      \ 'directory_icon': '',
      \ 'opened_icon': '',
      \ })
"}}}

" Keymap; Open Preceding Tree
nnoremap <silent> <a-v>
      \ :<c-u>Defx `expand('%:p:h')` -search=`expand('%:p')`
      \ -split=vertical -winwidth=30 -winheight=60 -direction=topleft
      \ <cr>

nnoremap <silent> <a-b>
      \ :<c-u>Defx `expand('%:p:h')` -search=`expand('%:p')` -split=tab
      \ <cr>

function! s:defx_keymap_explorer() abort
  " Explore; hjkl {{{
  nnoremap <buffer> gg ggj
  nnoremap <silent><buffer><expr> h
        \ defx#do_action('cd', ['..'])
  "nnoremap <silent><buffer><expr> j
        \ line('.') == line('$') ? 'gg' : 'j'
  "nnoremap <silent><buffer><expr> k
        \ line('.') == 1 ? 'G' : 'k'
  nnoremap <silent><buffer><expr> l
        \ defx#do_action('open_directory')
  "}}}
  " Explore; CWD {{{
  "" CWD; defx's
  nnoremap <silent><buffer><expr> ~
        \ defx#do_action('cd')
  "" CWD; vim's
  nnoremap <silent><buffer><expr> <a-w>.
        \ defx#do_action('change_vim_cwd')
  nnoremap <silent><buffer><expr> <a-w><a-.>
        \ defx#do_action('change_vim_cwd')
  "}}}
  " Explore; netrw-like {{{
  nnoremap <silent><buffer><expr> -
        \ defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> D
        \ executable('trash')
        \ defx#do_action('remove')
  nnoremap <silent><buffer><expr> R
        \ defx#do_action('rename')
  nnoremap <silent><buffer><expr> d
        \ defx#do_action('new_directory')
  nnoremap <silent><buffer><expr> %
        \ defx#do_action('new_file')
  "}}}
  " Explore; Sort {{{
  nnoremap <silent><buffer><expr> <a-s>t
        \ defx#do_action('toggle_sort', 'time')
  nnoremap <silent><buffer><expr> <a-s>z
        \ defx#do_action('toggle_sort', 'size')
  nnoremap <silent><buffer><expr> <a-s>x
        \ defx#do_action('toggle_sort', 'extention')
  nnoremap <silent><buffer><expr> <a-s><a-s>
        \ defx#do_action('toggle_sort', 'filename')
  "}}}
  " Toggle; Mark {{{
  nnoremap <silent><buffer><expr> mm
        \ defx#do_action('toggle_select')
  nnoremap <silent><buffer><expr> mj
        \ defx#do_action('toggle_select') . 'j' .
        \ defx#do_action('toggle_select') . 'k'
  nnoremap <silent><buffer><expr> mk
        \ defx#do_action('toggle_select') . 'k' .
        \ defx#do_action('toggle_select') . 'j'
  nnoremap <silent><buffer><expr> mc
        \ defx#do_action('clear_select_all')
  "" Select; All
  nnoremap <silent><buffer><expr> ma
        \ defx#do_action('multi', ['clear_select_all','toggle_select_all'])
  nnoremap <silent><buffer><expr> *
        \ defx#do_action('multi', ['clear_select_all','toggle_select_all'])
  "" Select; Reverse selected conditions.
  nnoremap <silent><buffer><expr> mr
        \ defx#do_action('toggle_select_all')
  "}}}
  " Toggle; Hidden Files {{{
  nnoremap <silent><buffer><expr> z.
        \ defx#do_action('toggle_ignored_files')
  "}}}
  " Selected; Open {{{
  nnoremap <silent><buffer><expr> <CR>
        \ defx#do_action('drop')
  nnoremap <silent><buffer><expr> <c-v>
        \ defx#do_action('open', 'vsplit')
  " TODO: `:wincmd p` will apply only when the defx buffer is narrow.
  nnoremap <silent><buffer><expr> <c-s>
        \ defx#do_action('open', 'wincmd p <bar> split')
  nnoremap <silent><buffer><expr> <c-b>
        \ defx#do_action('open', 'tabe')
  "}}}
  "" Open; Tree {{{
  nnoremap <silent><buffer><expr> u
        \ defx#do_action('open_or_close_tree')
  nnoremap <silent><buffer><expr> U
        \ defx#do_action('open_or_close_tree')
  nnoremap <silent><buffer><expr> za
        \ defx#do_action('open_or_close_tree')
  nnoremap <silent><buffer><expr> zo
        \ defx#do_action('open_tree')
  nnoremap <silent><buffer><expr> zO
        \ defx#do_action('open_tree_recursive')
  nnoremap <silent><buffer><expr> zc
        \ defx#do_action('close_tree')
  nnoremap <silent><buffer><expr> zu
        \ defx#do_action('open_tree')
  "}}}
  " Selected; Clipboard {{{
  " copy: yank in plus register
  nnoremap <buffer><expr> yy
        \ defx#do_action('copy')
  nnoremap <buffer><expr> cc
        \ defx#do_action('move')
  nnoremap <buffer><expr> p
        \ defx#do_action('paste')
  " yank_path: yank in unnamed register
  "nnoremap <buffer><expr> yy
  "      \ defx#do_action('yank_path')
  "}}}
  " Selected; Execute {{{
  nnoremap <silent><buffer><expr> X
        \ defx#do_action('execute_system')
  nnoremap <silent><buffer><expr> !
        \ defx#do_action('execute_system')
  "}}}
endfunction
augroup DefxOnBuffer
  au!
  " TODO: highlight on top as there's filepath, or place those path on another place.
  au FileType defx setl bt=quickfix signcolumn=
  au FileType defx call <SID>defx_keymap_explorer()
augroup END
