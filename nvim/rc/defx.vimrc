scriptencoding utf-8
" From: finder.toml
" Repo: Shougo/defx.nvim
" Ref: /usr/share/nvim/runtime/autoload/netrw.vim
" Ref: /usr/share/nvim/runtime/plugin/netrwPlugin.vim

" Prepare commands to chmod on defx.
" TODO: make it a carrent path.
"command! Chmod_755 :call setfperm(<cfile>, 'rwxr-xr-x')
"command! Chmod_666 :call setfperm(<cfile>, 'rw-rw-rw-')
"command! Chmod_644 :call setfperm(<cfile>, 'rw-r--r--')
"command! Chmod_444 :call setfperm(<cfile>, 'r--r--r--')

" Use Defx instead of Netrw {{{1
let g:loaded_netrwPlugin = 1
let g:loaded_netrw = 1
"}}}

"" Defx-Icons {{{1
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
" call defx#custom#foo() {{{1
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
"}}}

" Keymap; call Defx
"" Call; Open Preceding Tree {{{1
" Note: -search must be applied full path.
" TODO: on Term-Mode, not to get errors; like get path with !pwd.
nnoremap <silent> <a-v>
      \ :<c-u>Defx `expand('%:p:h')` -search=`expand('%:p')`
      \ -split=vertical -winwidth=32 -winheight=60 -direction=topleft
      \ <cr>
nnoremap <silent> <a-b>
      \ :<c-u>Defx `expand('%:p:h')` -search=`expand('%:p')` -split=tab
      \ <cr>
"}}}

"" TODO: Overwrap netrw; Get knowledge to get full path from `set path` as `gf`.
"" Sample: /usr/share/nvim/runtime/ftplugin/ruby.vim #223
"augroup FileExplorer
"  au!
"  au BufLeave *  if &ft != "netrw"|let w:netrw_prvfile= expand("%:p")|endif
"  au BufEnter *  sil call s:LocalBrowse(expand("<amatch>"))
"  au VimEnter * sil call s:VimEnter(expand("<amatch>"))
"  if has("win32") || has("win95") || has("win64") || has("win16")
"    au BufEnter .* sil call s:LocalBrowse(expand("<amatch>"))
"  endif
"augroup END
" s:VimEnter: after all vim startup stuff is done, this function is called. {{{2
"             Its purpose: to look over all windows and run s:LocalBrowse() on
"             them, which checks if they're directories and will create a directory
"             listing when appropriate.
"             It also sets s:vimentered, letting s:LocalBrowse() know that s:VimEnter()
"             has already been called.
"fun! s:VimEnter(dirname)
"  "  call Dfunc("s:VimEnter(dirname<".a:dirname.">) expand(%)<".expand("%").">")
"  let curwin       = winnr()
"  let s:vimentered = 1
"  windo call s:LocalBrowse(expand("%:p"))
"  exe curwin."wincmd w"
"  "  call Dret("s:VimEnter")
"endfun

" Overwrap; gf on directory, :netrw, too {{{1
" TODO: get full-path via &path
"command! -nargs=* -range -bar -complete=dir
"      \ Defx
"      \ call defx#util#call_defx('Defx', <q-args>)
"nnoremap <silent> gf      <SID>c:find <Plug><cfile><cr>
"nnoremap <silent> <c-w>gf gf :<c-u>Defx -direction=belowright -split=horizontal <cr>
"nnoremap <silent> <c-w>f  gf :<c-u>Defx -direction=belowright -split=vertical<cr>
"nnoremap <silent> <c-w>F  gf :<c-u>Defx -split=tab<cr>
"}}}1

function! s:defx_keymap_explorer() abort
  " Unmap; not to open defx on defx {{{1
  nnoremap <buffer> <a-v> <a-v>
  nnoremap <buffer> <a-b> <a-b>
  " Explore; hjkl {{{1
  nnoremap <buffer><silent> gg :2<cr>
  nnoremap <silent><buffer><expr> h
        \ defx#do_action('cd', ['..'])
  "nnoremap <silent><buffer><expr> j
        \ line('.') == line('$') ? 'gg' : 'j'
  "nnoremap <silent><buffer><expr> k
        \ line('.') == 1 ? 'G' : 'k'
  nnoremap <silent><buffer><expr> l
        \ defx#do_action('open_directory')
  " Explore; CWD {{{1
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
  " Toggle; Hidden Files {{{1
  nnoremap <silent><buffer><expr> z.
        \ defx#do_action('toggle_ignored_files')
  " Selected; Open {{{1
  nnoremap <silent><buffer><expr> <CR>
        \ defx#do_action('drop')
  nnoremap <silent><buffer><expr> <c-v>
        \ defx#do_action('open', 'vsplit')
  " TODO: `:wincmd p` will apply only when the defx buffer is narrow.
  nnoremap <silent><buffer><expr> <c-s>
        \ defx#do_action('open', 'wincmd p <bar> split')
  nnoremap <silent><buffer><expr> <c-b>
        \ defx#do_action('open', 'tabe')
  "" Open; Tree {{{1
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
  " Selected; Register {{{1
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
  " Selected; Execute {{{1
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
  "au BufNew * if @% !=# 'defx' | au! BufEnter * ++once call <SID>open_on_defx()
  au BufNew * call <SID>open_on_defx()
  "au BufEnter * if isdirectory(expand('%:p')) | Defx -search=expand('<amatch>')
augroup END
function! s:open_on_defx() abort "{{{1
  if @% !=# 'defx'
    function! s:open_in_defx()
      if isdirectory(expand('<amatch>'))
        Defx -search=expand('<amatch>')
      endif
    endfunction
    au! BufEnter * ++once call <SID>open_in_defx()
  endif
endfunction
