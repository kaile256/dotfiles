scriptencoding utf-8
" From: browse.toml
" Repo: Shougo/defx.nvim
" Another: ftplugin/defx

" Ref: /usr/share/nvim/runtime/autoload/netrw.vim
" Ref: /usr/share/nvim/runtime/plugin/netrwPlugin.vim
" Ref: source/defx-icons.vim

" call defx#custom#foo() {{{1
call defx#custom#option('_', 'drives', [
      \ expand('~'),
      \ expand('~/Downloads'),
      \ ])

" TODO: Get defx's cwd with neither auto_cd nor getline(1).
" Ref: Default values
"   => Shougo/defx.nvim/autoload/defx/init.vim @94
call defx#custom#option('_', {
      \ 'columns': g:defx_format_full,
      \ 'split': 'no',
      \ 'new': 1,
      \ 'show_ignored_files': 1,
      \ 'root_marker': ':',
      \ 'auto_cd': 1,
      \
      \ 'vertical_preview': 1,
      \ 'preview_width': 120,
      \
      \ 'floating_preview': 1,
      \ 'preview_height': 80,
      \ })

call defx#custom#column('filename', {
      \ 'root_marker_highlight': 'Ignore',
      \ })

call defx#custom#column('mark', {
      \ 'readonly_icon': '✗',
      \ 'selected_icon': '✓',
      \ })

