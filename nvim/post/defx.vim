scriptencoding utf-8
" From: finder.toml
" Repo: Shougo/defx.nvim
" Another: add/defx.vim
" Ref: /usr/share/nvim/runtime/autoload/netrw.vim
" Ref: /usr/share/nvim/runtime/plugin/netrwPlugin.vim

" Prepare commands to chmod on defx.
" TODO: make it a carrent path.
"command! Chmod_755 :call setfperm(<cfile>, 'rwxr-xr-x')
"command! Chmod_666 :call setfperm(<cfile>, 'rw-rw-rw-')
"command! Chmod_644 :call setfperm(<cfile>, 'rw-r--r--')
"command! Chmod_444 :call setfperm(<cfile>, 'r--r--r--')

"" Defx-Icons {{{1
"" Note: defx-icons collapses i3 or qt.
"" Note: Syntax highlighting can cause some performance issues in defx window.
"let g:defx_icons_enable_syntax_highlight = 0
"let g:defx_icons_column_length = 2
"let g:defx_icons_directory_icon = ''
"let g:defx_icons_directory_icon = ''
"let g:defx_icons_mark_icon = '*'
"let g:defx_icons_parent_icon = ''
"let g:defx_icons_default_icon = ''
"let g:defx_icons_directory_symlink_icon = ''
"" Options below are applicable only when using "tree" feature
"let g:defx_icons_root_opened_tree_icon = ''
"let g:defx_icons_nested_opened_tree_icon = ''
"let g:defx_icons_nested_closed_tree_icon = ''
" call defx#custom#foo() {{{1
call defx#custom#option('_', {
      \ 'columns': 'mark:indent:git:icons:filename',
      \ 'show_ignored_files': 1,
      \ })
call defx#custom#column('mark', {
      \ 'readonly_icon': '✗',
      \ 'selected_icon': '✓',
      \ })
"call defx#custom#column('icon', {
"      \ 'directory_icon': '',
"      \ 'opened_icon': '',
"      \ })
"call defx#custom#column('icon', {
"      \ 'directory_icon': '',
"      \ 'opened_icon': '',
"      \ })
"call defx#custom#column('icon', {
"        \ 'directory_icon': '▸',
"        \ 'opened_icon': '▾',
"        \ 'root_icon': ' ',
"        \ })
"}}}

let g:defx_is_narrow = 50
let g:defx_is_wide = g:defx_is_narrow

function! s:defx_keymap_explorer() abort
  " Explore; hjkl {{{1
  nnoremap <buffer><silent> gg :2<cr>
  nnoremap <silent><buffer><expr> h
        \ defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> l
        \ (winwidth('.') < g:defx_is_wide)?
        \ defx#do_action('open_directory'):
        \ defx#do_action('open_tree')
  " Explore; CWD {{{1
  "" CWD; defx's
  nnoremap <silent><buffer><expr> ~
        \ defx#do_action('cd')
        \ . ':echo "cd" $HOME<CR>'
  "" CWD; vim's
  " Note: @% will be 'foo/[defx]'
  nnoremap <silent><buffer><expr> <a-w>w
        \ defx#do_action('change_vim_cwd')
        \ . ':echo "cd" expand("<cfile>:p:h")<CR>'
        "\ . `:echo 'cd' ` . getcwd()
  nnoremap <silent><buffer><expr> <a-w><a-w>
        \ defx#do_action('change_vim_cwd')
        \ . ':echo "cd" expand("<cfile>:p:h")<CR>'
  " Explore; netrw-like {{{1
  nnoremap <silent><buffer><expr> -
        \ defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> D
        \ defx#do_action('remove_trash')
        "\ defx#do_action('remove')
  nnoremap <silent><buffer><expr> R
        \ defx#do_action('rename')
  nnoremap <silent><buffer><expr> d
        \ defx#do_action('new_directory')
  nnoremap <silent><buffer><expr> %
        \ defx#do_action('new_file')
  " Explore; Sort {{{1
  nnoremap <silent><buffer><expr> <a-s>t
        \ defx#do_action('toggle_sort', 'time')
  nnoremap <silent><buffer><expr> <a-s>z
        \ defx#do_action('toggle_sort', 'size')
  nnoremap <silent><buffer><expr> <a-s>x
        \ defx#do_action('toggle_sort', 'extention')
  nnoremap <silent><buffer><expr> <a-s><a-s>
        \ defx#do_action('toggle_sort', 'filename')
  "nnoremap <silent><buffer><expr> C
  "      \ defx#do_action('toggle_columns',
  "      \                'mark:indent:icon:filename:type:size:time')
  " Selected; Open File {{{1
  " TODO: Make User's event on buffer's openning from defx.
  nnoremap <silent><buffer><expr> <c-j>
        \ (winwidth('.') > g:defx_is_wide)?
        \ defx#is_directory()?
        \ defx#do_action('open_tree'):
        \ defx#do_action('multi', ['open', 'quit']):
        \ . '<c-w>q'
        \ defx#is_directory()?
        \ defx#do_action('open'):
        \ defx#do_action('multi', [['open', 'drop'], 'quit'])
        \ . '<c-w>q'
  nnoremap <silent><buffer><expr> <CR>
        \ (winwidth('.') > g:defx_is_wide)?
        \ defx#is_directory()?
        \ defx#do_action('open_tree'):
        \ defx#do_action('multi', ['drop', 'quit']):
        \ defx#is_directory()?
        \ defx#do_action('open'):
        \ defx#do_action('multi', ['drop', 'quit'])
        \ . '<c-w>q'
  nnoremap <silent><buffer><expr> <TAB>
        \ defx#do_action('open', 'bel vsplit')
        \ . ':wincmd p<cr>'
  " Note: defx's quit with split doesn't work well.
  nnoremap <silent><buffer><expr> <a-v>
        \ defx#do_action('open', 'vsplit')
        \ .':'. bufwinnr(bufname("\[defx\]")) .'close<cr>'
  " Note: <c-s> freezes screen on some unix.
  nnoremap <silent><buffer><expr> <a-s>
        \ defx#do_action('open', 'bot split')
        \ .':'. bufwinnr(bufname("\[defx\]")) .'close<cr>'
  nnoremap <silent><buffer><expr> <a-t>
        \ defx#do_action('drop', 'tabe')
  " Selected; Open Tree {{{1
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
  nnoremap <silent><buffer><expr> zu
        \ defx#do_action('open_tree')
  nnoremap <silent><buffer><expr> <c-o>
        \ (&l:winwidth < g:defx_is_narrow)
        \ && (win_screenpos(3) != [0,0])?
        \ ':wincmd p <bar> close <bar> :wincmd p<cr>'
        \ : '<c-o>'
  " Selected; Close Tree {{{1
  nnoremap <silent><buffer><expr> zc
        \ defx#do_action('close_tree')
  " Selected; Register {{{1
  " copy: yank in defx's register
  " Note: CANNOT register multiple files into defx-register.
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
  " Selected; Execute {{{1
  nnoremap <silent><buffer><expr> X
        \ defx#do_action('execute_system')
  nnoremap <silent><buffer><expr> !
        \ defx#do_action('execute_command')
  "}}}
  " Toggle; Mark {{{1
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
  xnoremap <silent><buffer><expr> m
        \ defx#do_action('toggle_select_visual')
  " Toggle; Hidden Files {{{1
  nnoremap <silent><buffer><expr> z.
        \ defx#do_action('toggle_ignored_files')
  "}}}
  nnoremap <silent><buffer><expr> .
        \ defx#do_action('repeat')
endfunction
augroup OnDefxBuffer
  au!
  " TODO: highlight on top as there's filepath, or place those path on another place.
  au FileType defx setl nonumber signcolumn=
  au FileType defx call s:defx_keymap_explorer()
  function! defx#execute(...) abort
    " TODO: quit defx after action.
    let l:id = win_getid()
    call defx#do_action(a:000)
    windo
          \ if bufname('%') =~# '\[defx\]'
          \ |   quit
          \ | endif
    call win_gotoid(l:id)
  endfunction
augroup END
