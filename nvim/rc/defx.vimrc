scriptencoding utf-8
" From: finder.toml
" Repo: Shougo/defx.nvim

" Prepare commands to chmod on defx.
"command! Chmod_755 :call setfperm(<cfile>, 'rwxr-xr-x')
"command! Chmod_666 :call setfperm(<cfile>, 'rw-rw-rw-')
"command! Chmod_644 :call setfperm(<cfile>, 'rw-r--r--')
"command! Chmod_444 :call setfperm(<cfile>, 'r--r--r--')

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
      \ 'columns': 'mark:git:indent:icons:filename:size:time',
      \ 'show_ignored_files': 1,
      \ })
"call defx#custom#column('filename', {
"      \ 'directory_icon': '',
"      \ 'opened_icon': '',
"      \ })
""}}}

" Keymap; call Defx
"" Call; Open Preceding Tree
" TODO: on Term-Mode, not to get errors; like get path with !pwd.
nnoremap <silent> <a-v>
      \ :<c-u>Defx `expand('%:p:h')` -search=`expand('%:p')`
      \ -split=vertical -winwidth=32 -winheight=60 -direction=topleft
      \ <cr>

nnoremap <silent> <a-b>
      \ :<c-u>Defx `expand('%:p:h')` -search=`expand('%:p')` -split=tab
      \ <cr>

"" Call; Goto file/directory
" overwrap :netrw
noremap <silent> gf      :<c-u>Defx -search=`expand('<cword>')` <cr>
noremap <silent> <c-w>gf :<c-u>Defx -search=`expand('<cword>')` -direction=belowright -split=horizontal <cr>
noremap <silent> <c-w>f  :<c-u>Defx -search=`expand('<cword>')` -direction=belowright -split=vertical<cr>
noremap <silent> <c-w>F  :<c-u>Defx -search=`expand('<cword>')` -split=tab<cr>

function! s:defx_keymap_explorer() abort
  " Unmap; not to open defx on defx {{{
  nnoremap <buffer> <a-v> <a-v>
  nnoremap <buffer> <a-b> <a-b>
  "}}}
  " Explore; hjkl {{{
  nnoremap <buffer><silent> gg :2<cr>
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
        \ . ':echo "cd" $HOME<CR>'
  "" CWD; vim's
  " Note: @% will be 'foo/[defx]'
  nnoremap <silent><buffer><expr> <a-w>.
        \ defx#do_action('change_vim_cwd')
        \ . ':echo "cd" expand("<cfile>:p:h")<CR>'
  nnoremap <silent><buffer><expr> <a-w><a-.>
        \ defx#do_action('change_vim_cwd')
        \ . ':echo "cd" expand("<cfile>:p:h")<CR>'
  "}}}
  " Explore; netrw-like {{{
  nnoremap <silent><buffer><expr> -
        \ defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> D
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
        \ defx#do_action('toggle_select') . 'j'
  nnoremap <silent><buffer><expr> mk
        \ defx#do_action('toggle_select') . 'k' .
        \ defx#do_action('toggle_select') . 'k'
  nnoremap <silent><buffer><expr> mc
        \ defx#do_action('clear_select_all')
  "" Mark; All
  nnoremap <silent><buffer><expr> ma
        \ defx#async_action('multi', ['clear_select_all','toggle_select_all'])
  nnoremap <silent><buffer><expr> *
        \ defx#async_action('multi', ['clear_select_all','toggle_select_all'])
  "" Mark; Reverse selected conditions.
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
  " Selected; Register {{{
  " copy: yank in defx's register
  nnoremap <buffer><expr> yy
        \ defx#do_action('copy')
  nnoremap <buffer><expr> Y
        \ defx#do_action('copy')
  nnoremap <buffer><expr> cc
        \ defx#do_action('move')
  nnoremap <buffer><expr> C
        \ defx#do_action('move')
  nnoremap <buffer><expr> p
        \ defx#do_action('paste')
  " yank_path: yank in unnamed register
  nnoremap <buffer><expr> <space>y
        \ defx#do_action('yank_path')
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
