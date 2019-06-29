"""" Shortcut
"" on Sidebar
nmap <silent> <space>sf :Defx -split=vertical -winwidth=50 -direction=topleft<cr>
"" Optional
nmap <silent> <space><space>fe               :<c-u>Defx 
nmap <silent> <space><space>fv :<c-u>vne<cr> :<c-u>Defx 
nmap <silent> <space><space>fs :<c-u>sp<cr>  :<c-u>Defx 
nmap <silent> <space><space>fb :<c-u>tabe<cr>:<c-u>Defx 
"" Home
nmap <silent> <space>fe               :<c-u>Defx ~<cr>
nmap <silent> <space>fv :<c-u>vne<cr> :<c-u>Defx ~<cr>
nmap <silent> <space>fs :<c-u>sp<cr>  :<c-u>Defx ~<cr>
nmap <silent> <space>fb :<c-u>tabe<cr>:<c-u>Defx ~<cr>
"" Current File
nmap <silent> <space>.fe               :<c-u>Defx .<cr>
nmap <silent> <space>.fv :<c-u>vne<cr> :<c-u>Defx .<cr>
nmap <silent> <space>.fs :<c-u>sp<cr>  :<c-u>Defx .<cr>
nmap <silent> <space>.fb :<c-u>tabe<cr>:<c-u>Defx .<cr>
nmap <silent> <space>f-  :<c-u>Defx `expand('%:p:h')` -search=`expand('%:p')`<cr>
"" init.vim
nmap <silent> <space>ife :<c-u>Defx ~/dotfiles/nvim<CR>
nmap <silent> <space>ifs :<c-u>Defx ~/dotfiles/nvim<CR>
nmap <silent> <space>ifv :<c-u>Defx ~/dotfiles/nvim<CR>
nmap <silent> <space>ifb :<c-u>Defx ~/dotfiles/nvim<CR>
"" Plugins list: dein's toml
nmap <silent> <space>pfe :<c-u>Defx ~/dotfiles/nvim/dein.d<CR>
nmap <silent> <space>pfs :<c-u>Defx ~/dotfiles/nvim/dein.d<CR>
nmap <silent> <space>pfv :<c-u>Defx ~/dotfiles/nvim/dein.d<CR>
nmap <silent> <space>pfb :<c-u>Defx ~/dotfiles/nvim/dein.d<CR>
"" Stand-by a CloudNote
nmap <silent> <space>nfe :<c-u>Defx          ~/CloudNote<C-i>
nmap <silent> <space>nfs :<c-u>sp<cr>:Defx   ~/CloudNote<C-i>
nmap <silent> <space>nfv :<c-u>vne<cr>:Defx  ~/CloudNote<C-i>
nmap <silent> <space>nfb :<c-u>tabe<cr>:Defx ~/CloudNote<C-i>

"""" Keybinds on Defx
autocmd FileType defx call s:defx_my_settings()

function! s:defx_my_settings() abort
  nnoremap <silent><buffer><expr> q
        \ defx#do_action('quit')

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
        \ defx#do_action('open', 'vsplit')
  "" other open-actions
  nnoremap <silent><buffer><expr> v
        \ defx#do_action('open', 'vsplit')
  nnoremap <silent><buffer><expr> o
        \ defx#do_action('open', 'split')
  nnoremap <silent><buffer><expr> p
        \ defx#do_action('open', 'pedit')
  nnoremap <silent><buffer><expr> u
        \ defx#do_action('open_or_close_tree')
  nnoremap <silent><buffer><expr> <CR>
        \ defx#do_action('open_or_close_tree')

 """ File-Management
  " Clipboard
  " show the path under cursor on status-bar.
  nnoremap <silent><buffer><expr> mc
        \ defx#do_action('copy')
  nnoremap <silent><buffer><expr> mm
        \ defx#do_action('move')
  nnoremap <silent><buffer><expr> mp
        \ defx#do_action('paste')
  nnoremap <silent><buffer><expr> yy
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

endfunction
