"""" From: Init.toml
"""" With: defx-extra.vimrc
""""  Ref: denite.vimrc

"if !has('win64')
"  command Defx :Defx -columns=git:markfilename:type
"  command Defx :Defx -columns=icons:indent:filename:type
"endif
"
"augroup DefxStartify
"  au! FileType netrw Defx `expand('%:p:h')` -search=`expand('%:p')`
"augroup END

"""" KEYMAP
""" Open Preceding Tree
" type '-' to parent dir
" type 'v' to open like a filer
"nnoremap <silent> <space>- :<c-u>Defx <c-r>=expand('s:parent_dir')<cr> <c-r>=expand('s:depth_1')<cr><cr>
nnoremap <silent> <a-v>
      \ :<c-u>Defx `expand('%:p:h')` -search=`expand('%:p')`
      \ -split=vertical -winwidth=35 -winheight=60 -direction=topleft <cr>
"nnoremap <silent> <a-t>
"      \ :<c-u>Defx `expand('%:p:h')` -search=`expand('%:p')` -split=tab<cr>

function! s:defx_keymap_explorer() abort
  """ Explore Tree
  nnoremap <silent><buffer><expr> ~
        \ defx#do_action('cd')
  nnoremap <silent><buffer><expr> f
        \ defx#do_action('search')
  "" hjkl
  " h:back on tree
  nnoremap <silent><buffer><expr> h
        \ defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> j
        \ line('.') == line('$') ? 'gg' : 'j'
  nnoremap <silent><buffer><expr> k
        \ line('.') == 1 ? 'G' : 'k'
  nnoremap <silent><buffer><expr> l
        \ defx#do_action('drop')
  "" netrw-like
  nnoremap <silent><buffer><expr> -
        \ defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> <CR>
        \ defx#do_action('drop')
  nnoremap <silent><buffer><expr> v
        \ defx#do_action('open', 'vsplit')
  nnoremap <silent><buffer><expr> o
        \ defx#do_action('open', 'split')
  nnoremap <silent><buffer><expr> u
        \ defx#do_action('open_or_close_tree')

  """ File-Management
  " Clipboard
  " show the path under cursor on status-bar.
  nnoremap <buffer><expr> yw
        \ defx#do_action('copy')
  nnoremap <buffer><expr> ye
        \ defx#do_action('copy')
  nnoremap <buffer><expr> dw
        \ defx#do_action('move')
  nnoremap <buffer><expr> de
        \ defx#do_action('move')
  nnoremap <buffer><expr> p
        \ defx#do_action('paste')
  nnoremap <buffer><expr> yy
        \ defx#do_action('yank_path')
  "" Select
  nnoremap <silent><buffer><expr> <Space>
        \ defx#do_action('toggle_select') . 'j'
  " reverse all select conditions.
  nnoremap <silent><buffer><expr> *
        \ defx#do_action('toggle_select_all')
  " netrw-like
  nnoremap <silent><buffer><expr> c
        \ defx#do_action('change_vim_cwd')
  nnoremap <silent><buffer><expr> D
        \ defx#do_action('remove')
  nnoremap <silent><buffer><expr> R
        \ defx#do_action('rename')
  nnoremap <silent><buffer><expr> d
        \ defx#do_action('new_directory')
  nnoremap <silent><buffer><expr> %
        \ defx#do_action('new_file')

  nnoremap <silent><buffer><expr> !
        \ defx#do_action('execute_system')

  """ Toggle
  "" Ignored/Hidden File
  nnoremap <silent><buffer><expr> .
        \ defx#do_action('toggle_ignored_files')

  "" Sort
  nnoremap <silent><buffer><expr> st
        \ defx#do_action('toggle_sort', 'time')
  nnoremap <silent><buffer><expr> sz
        \ defx#do_action('toggle_sort', 'size')
  nnoremap <silent><buffer><expr> sx
        \ defx#do_action('toggle_sort', 'extention')
  nnoremap <silent><buffer><expr> sn
        \ defx#do_action('toggle_sort', 'filename')

endfunction

augroup DefxConfig
  au!
  au FileType defx call s:defx_keymap_destination()
  au FileType defx call s:defx_keymap_explorer()
augroup END

