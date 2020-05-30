scriptencoding utf-8
" From: browse.toml
" Repo: Shougo/defx.nvim
" Another: add/defx.vim
" Ref: /usr/share/nvim/runtime/autoload/netrw.vim
" Ref: /usr/share/nvim/runtime/plugin/netrwPlugin.vim
" Ref: source/defx-icons.vim

" call defx#custom#foo() {{{1
call defx#custom#option('_', 'drives', [
      \ expand('~'),
      \ expand('~/Downloads'),
      \ ])

call defx#custom#option('_', {
      \ 'columns': 'mark:indent:git:icons:filename',
      \ 'winheight': winheight('.'),
      \ 'show_ignored_files': 1,
      \ 'root_marker': ':',
      \ 'auto_cd': 1,
      \ })

call defx#custom#column('filename', {
      \ 'root_marker_highlight': 'Ignore',
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

function! s:defx_do_action_visual(action, ...) abort "{{{1
  " Note: it fails in multi sequence at once.
  return defx#do_action('multi', ['clear_select_all', 'toggle_select_visual'])
        \ . defx#do_action('multi', [a:action, join(a:000, ',')])
endfunction

function! s:defx_is_wide() abort "{{{1
  if @% =~# '\[defx\]'
    return winwidth('.') > g:defx_sidebar_width
  endif
  return winwidth(bufwinnr('\[defx\]')) > g:defx_sidebar_width
endfunction
function! s:defx_is_narrow() abort
  return ! s:defx_is_wide()
endfunction
function! s:single_window_with_defx() abort
  " Return if no other windows but two window (defx and the other).
  return len(tabpagebuflist()) <= 2
endfunction
"let s:defx_is_wide   = {-> winwidth('.') > g:defx_standard_width}
"let s:defx_is_narrow = {-> winwidth('.') <= g:defx_standard_width}

function! s:defx_commands() abort "{{{1
  " Prepare commands to chmod on defx.
  " TODO: make it a carrent path.
  command! -buffer -range -nargs=1 Chmod :call s:chmod(<q-args>)
  if !exists('*s:chmod')
    function! s:chmod(rwx) abort
      let rwx =  a:rwx =~# 'r' ? 'r' : '-'
      let rwx .= a:rwx =~# 'w' ? 'w' : '-'
      let rwx .= a:rwx =~# 'x' ? 'x' : '-'
      " TODO: get current dir
      call setfperm(getcwd() .'/'. expand('<cfile>:p'), rwx . rwx . 'r--')
    endfunction
  endif
endfunction

function! s:defx_keymaps() abort "{{{1
  " TODO: what is the 'search' for?
  nnoremap <silent><nowait><buffer><expr> S
        \ defx#do_action('search')
  "nnoremap <silent><nowait><buffer> <c-w>=
  "      \ :setl nowinfixwidth<cr><c-w>=
  " Explore {{{2
  " Explore; hjkl {{{3
  nnoremap <silent><nowait><buffer> gg :2<cr>
  nnoremap <silent><nowait><buffer><expr> h
        \ defx#do_action('cd', ['..'])
  " Note: 'zb' to always show all dir/file
  nnoremap <silent><nowait><buffer><expr> l
        \ defx#do_action('open_directory')
        \ .'zb'
        "\ <SID>defx_is_wide()?
        "\ defx#do_action('open_tree')
  " Explore; CWD {{{3
  nnoremap <silent><nowait><buffer><expr> <c-g>
        \ defx#do_action('print')
  "" CWD; defx's
  nnoremap <silent><nowait><buffer><expr> ~
        \ defx#do_action('cd')
        \ .':echo "cd" $HOME<CR>'
  "" CWD; vim's
  " Note: @% will be 'foo/[defx]'
  nnoremap <silent><nowait><buffer><expr> <space>ww
        \ defx#do_action('change_vim_cwd')
        \ .':echo "cd" expand("<cfile>:p:h")<CR>'
        "\ . `:echo 'cd' ` . getcwd()
  " Explore; netrw-like {{{3
  nnoremap <silent><nowait><buffer><expr> -
        \ defx#do_action('cd', ['..'])
  nnoremap <silent><nowait><buffer><expr> D
        \ getcwd() =~# '^'. $XDG_DATA_HOME .'/Trash/' ?
        \ defx#do_action('remove') :
        \ defx#do_action('remove_trash')
  xnoremap <silent><nowait><buffer><expr> D
        \ getcwd() =~# '^'. $XDG_DATA_HOME .'/Trash/'
        \   ? <SID>defx_do_action_visual('remove')
        \   : <SID>defx_do_action_visual('remove_trash')
  nnoremap <silent><nowait><buffer><expr> \D
        \ defx#do_action('remove')
  nnoremap <silent><nowait><buffer><expr> R
        \ defx#do_action('rename')
  nnoremap <silent><nowait><buffer><expr> d
        \ defx#do_action('new_directory')
  nnoremap <silent><nowait><buffer><expr> %
        \ defx#do_action('new_file')
  " Explore; Sort {{{3
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
  " Open File {{{2
  " Edit {{{3
  " Mnemonic: Push the buffer
  nnoremap <silent><nowait><buffer><expr> P
        \ defx#do_action('drop')
  nnoremap <silent><nowait><buffer><expr> <c-j>
        \ <SID>defx_is_wide()?
        \ defx#do_action('open', 'edit'):
        \ <SID>single_window_with_defx()?
        \ defx#do_action('drop'):
        \ defx#do_action('multi', ['drop', 'quit'])
  nnoremap <silent><nowait><buffer><expr> <CR>
        \ <SID>defx_is_wide()?
        \ defx#do_action('open', 'edit'):
        \ <SID>single_window_with_defx()?
        \ defx#do_action('drop'):
        \ defx#do_action('multi', ['drop', 'quit'])
  xnoremap <silent><nowait><buffer><expr> P
        \ defx#async_action('multi',
        \ ['clear_select_all', 'toggle_select_visual', 'drop'])
  xnoremap <silent><nowait><buffer><expr> <c-j>
        \ defx#async_action('multi',
        \ ['clear_select_all', 'toggle_select_visual', 'drop', 'quit'])
  xnoremap <silent><nowait><buffer><expr> <CR>
        \ defx#async_action('multi',
        \ ['clear_select_all', 'toggle_select_visual', 'drop', 'quit'])
  " Split {{{3
  nnoremap <silent><nowait><buffer><expr> o
        \ defx#is_directory()
        \ ? defx#do_action('open')
        \ : defx#do_action('multi', [['drop', 'bel split'], 'quit'])
        "\ defx#do_action('drop', 'bel split')
  xnoremap <silent><nowait><buffer><expr> o
        \ defx#is_directory()
        \ ? '<Esc>'. defx#do_action('open')
        \ : defx#async_action('multi',
        \   ['clear_select_all', 'toggle_select_visual',
        \   ['drop', 'bel split'], 'quit'])
        "\ ['clear_select_all', 'toggle_select_visual', ['drop', 'bel split']])
  nnoremap <silent><nowait><buffer><expr> O
        \ defx#is_directory()
        \ ? defx#do_action('open')
        \ : defx#do_action('multi', [['open', 'bot vsplit'], 'quit'])
        "\ defx#do_action('open', 'bot vsplit')
  " TODO: open multiple buffers in each new windows in visualmode
  xnoremap <silent><nowait><buffer><expr> O
        \ defx#is_directory()
        \ ? '<Esc>'. defx#do_action('open')
        \ : defx#async_action('multi',
        \   ['clear_select_all', 'toggle_select_visual',
        \   ['open', 'bot vsplit'], 'quit'])
        "\ ['toggle_select_visual', ['open', 'bot vsplit']])
  nnoremap <silent><nowait><buffer><expr> gO
        \ defx#do_action('open', 'tabe')
  xnoremap <silent><nowait><buffer><expr> gO
        \ defx#async_action('multi',
        \ ['clear_select_all', 'toggle_select_visual', ['open', 'tabe']])
  " Note: <c-s> freezes screen on some unix.
  "nnoremap <silent><nowait><buffer> <c-w>v
  "      \ :`expand('g:defx_sidebar_width')` wincmd v setl winfixwidth'<cr>
  " Append window {{{4
  nnoremap <silent><nowait><buffer><expr> A
        \ defx#do_action('open', 'bot vsplit')
        \ .'<c-w>p'
  xnoremap <silent><nowait><buffer><expr> A
        \ defx#async_action('multi',
        \ ['clear_select_all', 'toggle_select_visual', ['open', 'bot vsplit']])
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
        \ ['clear_select_all', 'toggle_select_visual', ['drop', 'bel split']])
        \ .'<c-w>h'
  " Preview {{{4
  " Mnemonic: Insert a preview in actual windows
  " Note: :pclose to change location between vertical/horizontal
  nnoremap <silent><nowait><buffer><expr> I
        \ defx#do_action('open', 'pclose <bar> vert bot pedit')
        \ .'<c-w>='
  " FIXME: keep cursor on defx after :pedit ANYWHERE
  nnoremap <silent><nowait><buffer><expr> i
        \ <SID>defx_is_wide()?
        \ defx#do_action('open', 'pclose <bar> pedit'):
        \ defx#do_action('drop', 'pclose <bar> pedit')
        \ .'<c-w>h'
  " Mnemonic: Zip Preview
  nnoremap <silent><nowait><buffer> zp <c-w>z
  " in Tree {{{3
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
  " Note: CANNOT open multiple trees presently
  "nnoremap <silent><nowait><buffer><expr> zr
  "      \ defx#async_action('multi', [
  "      \ 'clear_select_all',
  "      \ 'toggle_select_all',
  "      \ 'open_tree',
  "      \ ])
  "nnoremap <silent><nowait><buffer><expr> zR
  "      \ defx#async_action('multi', [
  "      \ 'clear_select_all',
  "      \ 'toggle_select_all',
  "      \ 'open_tree_recursive',
  "      \ ])

  " Register {{{2
  " copy: yank in defx's register
  " Note: CANNOT register multiple files into defx-register.
  nnoremap <nowait><buffer><expr> yy
        \ defx#do_action('copy')
  " TODO: send 'r' to select rename at the prompt
  "   Note:
  "     ':call feedkeys("r", "nt")<cr>' only append the text itself to fname.
  nnoremap <nowait><buffer><expr> yp
        \ defx#do_action('multi', [
        \ 'copy',
        \ 'paste',
        \ ])
  nnoremap <nowait><buffer><expr> cc
        \ defx#do_action('move')
  nnoremap <nowait><buffer><expr> p
        \ defx#do_action('paste')
  " yank_path: yank in plus register
  nnoremap <nowait><buffer><expr> <space>yy
        \ defx#async_action('yank_path')
  " Execute {{{3
  nnoremap <silent><nowait><buffer><expr> X
        \ defx#do_action('execute_system')
  " Toggle {{{2
  " Toggle; Mark {{{3
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
        \ defx#async_action('multi', ['clear_select_all', 'toggle_select_all'])
  nnoremap <silent><nowait><buffer><expr> mgg
        \ defx#async_action('clear_select_all').
        \ 'vggj'.
        \ defx#async_action('toggle_select_visual')
  nnoremap <silent><nowait><buffer><expr> mG
        \ defx#async_action('clear_select_all').
        \ 'vG'.
        \ defx#async_action('toggle_select_visual')
  "" Mark; Reverse selected conditions.
  nnoremap <silent><nowait><buffer><expr> mr
        \ defx#do_action('toggle_select_all')
  xnoremap <silent><nowait><buffer><expr> m
        \ defx#do_action('toggle_select_visual')
  " Toggle; Hidden Files {{{3
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
  " Resize; {{{3
  nnoremap <silent><nowait><buffer><expr> >
        \ defx#do_action('resize',
        \ defx#get_context().winwidth + 10)
  nnoremap <silent><nowait><buffer><expr> <
        \ defx#do_action('resize',
        \ defx#get_context().winwidth - 10)
  nnoremap <silent><nowait><buffer><expr> .
        \ defx#do_action('repeat')
endfunction

if exists('#myDefxPost')
  au! myDefxPost
endif
augroup myDefxPost "{{{1
  au FileType defx exe 'setl path='. getbufvar('#', '&path')
  au BufWinLeave * if &ft ==# 'defx' | wincmd = | endif
  "" TODO: start cursor on filename
  "au BufEnter * if &ft ==# 'defx' |
  "      \ call search('\a', 'cW') |
  "      \ if winline() < (winheight('w$') / 2) | norm! zz |
  "      \ else | norm! zb |
  "      \ endif
  "      \ | endif
  " TODO: fix coc#_complete() for 'E121: Undefined variale: b:defx'
  au!
  " TODO: highlight on top as there's filepath, or place those path on another place.
  au FileType defx setl winfixwidth
  " 'bufhidden': default is 'hide', perhaps for resume of defx
  au FileType defx setl nonumber signcolumn= bufhidden=wipe previewheight=25
  "au WinEnter \[defx\]*
  "      \ if @# =~# '\[defx\]'
  "      \ && len(tabpagebuflist()) > 1
  "      \  | wincmd p | wincmd p
  "      \ | endif
  "au WinEnter * if s:defx_is_narrow() | call setbufvar(bufnr('\[defx\]'), '&winfixwidth', 1)
  "au WinNew   * if s:defx_is_narrow() | call setbufvar(bufnr('\[defx\]'), '&winfixwidth', 0)
  au FileType defx call s:defx_keymaps()
  au FileType defx call s:defx_commands()
  "au BufWritePost * call defx#redraw() " of course, includes a check for defx-channel
augroup END
