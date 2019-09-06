" From: tool.toml
" Ref: defx.vimrc

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
      \ 'columns': 'indent:mark:git:icons:filename:size:time',
      \ 'show_ignored_files': 1,
      \ })
"call defx#custom#column('filename', {
"      \ 'directory_icon': '',
"      \ 'opened_icon': '',
"      \ })
""}}}
