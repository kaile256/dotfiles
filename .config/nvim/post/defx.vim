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
      \ 'winheight': winheight('.'),
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

"let s:defx_is_wide   = {-> winwidth('.') > g:defx_standard_width}
"let s:defx_is_narrow = {-> winwidth('.') <= g:defx_standard_width}
function! s:defx_is_wide() abort
  return winwidth('%') > g:defx_standard_width
endfunction
function! s:defx_is_narrow() abort
  return winwidth('%') <= g:defx_standard_width
endfunction

function! s:defx_keymap_explorer() abort
  nnoremap <silent><nowait><buffer> <c-w>=
        \ :setl nowinfixwidth<cr><c-w>=
  " Explore {{{1
  " Explore; hjkl {{{2
  nnoremap <silent><nowait><buffer> gg :2<cr>
  nnoremap <silent><nowait><buffer><expr> h
        \ defx#do_action('cd', ['..'])
  nnoremap <silent><nowait><buffer><expr> l
        \ defx#do_action('open_directory')
        "\ <SID>defx_is_wide()?
        "\ defx#do_action('open_tree')
  " Explore; CWD {{{2
  nnoremap <silent><nowait><buffer><expr> <c-g>
        \ defx#do_action('print')
  "" CWD; defx's
  nnoremap <silent><nowait><buffer><expr> ~
        \ defx#do_action('cd')
        \ . ':echo "cd" $HOME<CR>'
  "" CWD; vim's
  " Note: @% will be 'foo/[defx]'
  nnoremap <silent><nowait><buffer><expr> <space>ww
        \ defx#do_action('change_vim_cwd')
        \ . ':echo "cd" expand("<cfile>:p:h")<CR>'
        "\ . `:echo 'cd' ` . getcwd()
  " Explore; netrw-like {{{2
  nnoremap <silent><nowait><buffer><expr> -
        \ defx#do_action('cd', ['..'])
  nnoremap <silent><nowait><buffer><expr> D
        \ defx#do_action('remove_trash')
        "\ defx#do_action('remove')
  nnoremap <silent><nowait><buffer><expr> R
        \ defx#do_action('rename')
  nnoremap <silent><nowait><buffer><expr> d
        \ defx#do_action('new_directory')
  nnoremap <silent><nowait><buffer><expr> %
        \ defx#do_action('new_file')
  " Explore; Sort {{{2
  nnoremap <silent><nowait><buffer><expr> st
        \ defx#do_action('toggle_sort', 'time')
  nnoremap <silent><nowait><buffer><expr> ss
        \ defx#do_action('toggle_sort', 'size')
  nnoremap <silent><nowait><buffer><expr> sz
        \ defx#do_action('toggle_sort', 'size')
  nnoremap <silent><nowait><buffer><expr> se
        \ defx#do_action('toggle_sort', 'extention')
  nnoremap <silent><nowait><buffer><expr> sx
        \ defx#do_action('toggle_sort', 'extention')
  nnoremap <silent><nowait><buffer><expr> sf
        \ defx#do_action('toggle_sort', 'filename')
  nnoremap <silent><nowait><buffer><expr> sn
        \ defx#do_action('toggle_sort', 'filename')
  "nnoremap <silent><nowait><buffer><expr> C
  "      \ defx#do_action('toggle_columns',
  "      \                'mark:indent:icon:filename:type:size:time')
  " Selected {{{1
  " Selected; Open File {{{2
  " TODO: Make User's event on buffer's openning from defx.
  nnoremap <silent><nowait><buffer><expr> <c-j>
        \ <SID>defx_is_wide()?
        \ defx#do_action('open'):
        \ defx#do_action('multi', ['drop', 'quit'])
  nnoremap <silent><nowait><buffer><expr> <CR>
        \ <SID>defx_is_wide()?
        \ defx#do_action('open'):
        \ defx#do_action('multi', ['drop', 'quit'])
  " Append window
  nnoremap <silent><nowait><buffer><expr> A
        \ defx#do_action('open', 'bot vsplit')
        \ .'<c-w>p'
  xnoremap <silent><nowait><buffer><expr> A
        \ defx#async_action('multi',
        \ ['toggle_select_visual', ['open', 'bot vsplit']])
        \ .'<c-w>p'
  " FIXME: always keep cursor on defx after drop to :split ANYWHERE
  nnoremap <silent><nowait><buffer><expr> a
        \ <SID>defx_is_wide()?
        \ defx#do_action('open', 'bel split')
        \ .'<c-w>k':
        \ defx#do_action('drop', 'bel split')
        \ .'<c-w>h'
  xnoremap <silent><nowait><buffer><expr> a
        \ defx#async_action('multi',
        \ ['toggle_select_visual', ['drop', 'bel split']])
        \ .'<c-w>h'
  " Mnemonic: Zip Preview
  nnoremap <silent><nowait><buffer> zp <c-w>z
  " TODO: what is the 'search'?
  nnoremap <silent><nowait><buffer><expr> S
        \ defx#do_action('search')
  " Insert a preview window in actual windows
  nnoremap <silent><nowait><buffer><expr> I
        \ defx#do_action('open', 'pclose <bar> vert bot pedit')
        \ .'<c-w>='
  " FIXME: keep cursor on defx after :pedit ANYWHERE
  nnoremap <silent><nowait><buffer><expr> i
        \ <SID>defx_is_wide()?
        \ defx#do_action('open', 'pclose <bar> pedit'):
        \ defx#do_action('drop', 'pclose <bar> pedit')
        \ .'<c-w>h'
  " Note: defx's quit with split doesn't work well.
  nnoremap <silent><nowait><buffer><expr> O
        \ defx#do_action('multi', [['open', 'bot vsplit'], 'quit'])
  xnoremap <silent><nowait><buffer><expr> O
        \ defx#async_action('multi',
        \ ['toggle_select_visual', ['open', 'bot vsplit'], 'quit'])
  " Note: <c-s> freezes screen on some unix.
  nnoremap <silent><nowait><buffer><expr> o
        \ defx#do_action('multi', [['drop', 'bel split'], 'quit'])
  xnoremap <silent><nowait><buffer><expr> o
        \ defx#async_action('multi',
        \ ['toggle_select_visual', ['drop', 'bel split'], 'quit'])
  nnoremap <silent><nowait><buffer><expr> gO
        \ defx#do_action('open', 'tabe')
  xnoremap <silent><nowait><buffer><expr> gO
        \ defx#async_action('multi',
        \ ['toggle_select_visual', ['open', 'tabe']])
  " Selected; Tree {{{2
  nnoremap <silent><nowait><buffer><expr> za
        \ defx#do_action('open_or_close_tree')
  nnoremap <silent><nowait><buffer><expr> zo
        \ defx#do_action('open_tree')
  nnoremap <silent><nowait><buffer><expr> zO
        \ defx#do_action('open_tree_recursive')
  nnoremap <silent><nowait><buffer><expr> zu
        \ defx#do_action('open_tree')
  nnoremap <silent><nowait><buffer><expr> zc
        \ defx#do_action('close_tree')
  " Selected; Register {{{2
  " copy: yank in defx's register
  " Note: CANNOT register multiple files into defx-register.
  nnoremap <nowait><buffer><expr> yy
        \ defx#do_action('copy')
  nnoremap <nowait><buffer><expr> Y
        \ defx#do_action('copy')
  nnoremap <nowait><buffer><expr> cc
        \ defx#do_action('move')
  nnoremap <nowait><buffer><expr> C
        \ defx#do_action('move')
  nnoremap <nowait><buffer><expr> p
        \ defx#do_action('paste')
  " yank_path: yank in unnamed register
  nnoremap <nowait><buffer><expr> yp
        \ defx#do_action('yank_path')
  " Selected; Execute {{{2
  nnoremap <silent><nowait><buffer><expr> X
        \ defx#do_action('execute_system')
  " Toggle {{{1
  " Toggle; Mark {{{2
  nnoremap <silent><nowait><buffer><expr> mm
        \ defx#do_action('toggle_select')
  nnoremap <silent><nowait><buffer><expr> mj
        \ defx#do_action('toggle_select') . 'j' .
        \ defx#do_action('toggle_select') . 'j'
  nnoremap <silent><nowait><buffer><expr> mk
        \ defx#do_action('toggle_select') . 'k' .
        \ defx#do_action('toggle_select') . 'k'
  nnoremap <silent><nowait><buffer><expr> mc
        \ defx#do_action('clear_select_all')
  "" Mark; All
  nnoremap <silent><nowait><buffer><expr> ma
        \ defx#async_action('multi', ['clear_select_all','toggle_select_all'])
  "" Mark; Reverse selected conditions.
  nnoremap <silent><nowait><buffer><expr> mr
        \ defx#do_action('toggle_select_all')
  xnoremap <silent><nowait><buffer><expr> m
        \ defx#do_action('toggle_select_visual')
  " Toggle; Hidden Files {{{2
  nnoremap <silent><nowait><buffer><expr> z.
        \ defx#do_action('toggle_ignored_files')
  " fold Normal - all you need
  nnoremap <silent><buffer><expr> zN
        \ defx#do_action('toggle_columns',
        \                'mark:indent:git:icons:filename:type:size:time')
  " fold None of unnecessary
  nnoremap <silent><buffer><expr> zn
        \ defx#do_action('toggle_columns',
        \                'mark:indent:git:icons:filename')
  " Resize; {{{2
  nnoremap <silent><nowait><buffer><expr> >
        \ defx#do_action('resize',
        \ defx#get_context().winwidth + 10)
  nnoremap <silent><nowait><buffer><expr> <
        \ defx#do_action('resize',
        \ defx#get_context().winwidth - 10)
  nnoremap <silent><nowait><buffer><expr> .
        \ defx#do_action('repeat')
  "}}}1
endfunction
augroup OnDefxBuffer
  au!
  " TODO: highlight on top as there's filepath, or place those path on another place.
  au FileType defx setl nonumber signcolumn= winfixwidth bufhidden=wipe previewheight=25
  "au WinEnter \[defx\]* call setbufvar(bufnr('\[defx\]'), '&winfixwidth', 1)
  "au BufLeave \[defx\]* call setbufvar(bufnr('\[defx\]'), '&winfixwidth', 0)
  au FileType defx call s:defx_keymap_explorer()
  "au BufWritePost * call defx#redraw() " of course, includes a check for defx-channel
augroup END
