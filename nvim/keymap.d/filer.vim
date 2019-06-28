"""" Initialize defx.nvim
nnoremap <space>fe :Defx ~<cr>
nnoremap <space>fv :vs ~<cr>:Defx<cr>
nnoremap <space>fs :sp $HOME<cr>:Defx<cr>
nnoremap <space>fb :tabe $HOME<cr>:Defx<cr>

"""" Keybinds on Defx
autocmd FileType defx call s:defx_my_settings()

function! s:defx_my_settings() abort
  " move between panes
  nnoremap <C-h> <C-w>h
  nnoremap <C-j> <C-w>j
  nnoremap <C-k> <C-w>k
  nnoremap <C-l> <C-w>l

  nnoremap <silent><buffer><expr> q
        \ defx#do_action('quit')

  """ Explore Tree
  nnoremap <silent><buffer><expr> ~
        \ defx#do_action('cd')
  " back on tree
  nnoremap <silent><buffer><expr> h
        \ defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> l
        \ defx#do_action('open')
  nnoremap <silent><buffer><expr> <CR>
        \ defx#do_action('open', 'vsplit')
  nnoremap <silent><buffer><expr> o
        \ defx#do_action('open', 'split')
  nnoremap <silent><buffer><expr> v
        \ defx#do_action('open', 'vsplit')
  nnoremap <silent><buffer><expr> b
        \ defx#do_action('open', 'tab')
  nnoremap <silent><buffer><expr> p
        \ defx#do_action('open', 'pedit')
  nnoremap <silent><buffer><expr> u
        \ defx#do_action('open_or_close_tree')

 """ File-Management
  nnoremap <silent><buffer><expr> mc
        \ defx#do_action('copy')
  nnoremap <silent><buffer><expr> mm
        \ defx#do_action('move')
  nnoremap <silent><buffer><expr> mp
        \ defx#do_action('paste')
  nnoremap <silent><buffer><expr> yy
        \ defx#do_action('yank_path')
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
  "" Ignored/Hidden File\
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

  "" Select
  nnoremap <silent><buffer><expr> <Space>
        \ defx#do_action('toggle_select') . 'j'
  nnoremap <silent><buffer><expr> *
        \ defx#do_action('toggle_select_all')
  nnoremap <silent><buffer><expr> j
        \ line('.') == line('$') ? 'gg' : 'j'
  nnoremap <silent><buffer><expr> k
        \ line('.') == 1 ? 'G' : 'k'
  nnoremap <silent><buffer><expr> <C-l>
        \ defx#do_action('redraw')
  nnoremap <silent><buffer><expr> <C-g>
        \ defx#do_action('print')
endfunction
