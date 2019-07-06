"""" TODO
"" show sym-links.
command! -nargs=* -range -bar -complete=customlist,defx#util#complete
      \ Defx
      \ call defx#util#call_defx('Defx', <q-args>)

"""" shortcut
""" Space-map
"" preceding tree
nmap <silent> <space>- :<c-u>Defx `expand('%:p:h')` -search=`expand('%:p')` -split=vertical -winwidth=35 -winheight=60 -direction=topleft <cr>

"" optional
nmap <space><space>e :<c-u>Defx 
nmap <space><space>s :<c-u>Defx -split=horizontal -winheight=60 -direction=topleft 
nmap <space><space>v :<c-u>Defx -split=vertical -winwidth=40 -winheight=60 -direction=topleft 
nmap <space><space>b :<c-u>Defx -split=tab 
"" Home
nmap <silent> <space>he :<c-u>Defx ~<cr>
nmap <silent> <space>hv :<c-u>Defx -split=vertical -winwidth=40 -winheight=60 -direction=topleft ~<cr>
nmap <silent> <space>hs :<c-u>Defx -split=horizontal -winheight=60 -direction=topleft ~<cr>
nmap <silent> <space>hb :<c-u>Defx -split=tab ~<cr>
"" Current File
nmap <silent> <space>.e :<c-u>Defx .<cr>
nmap <silent> <space>.v :<c-u>Defx -split=vertical -winwidth=40 -winheight=60 -direction=topleft .<cr>
nmap <silent> <space>.s :<c-u>Defx -split=horizontal -winhieght=60 -direction=topleft .<cr>
nmap <silent> <space>.b :<c-u>Defx -split=tab .<cr>

""" Praticular Dirs.
"let s:dotfiles_dir =              '~/dotfiles'
"let s:nvim_dir     = s:dotfiles . '/nvim'
"let s:keymap_dir   = s:nvim_dir . '/keymap.d'
"let s:plugins_dir  = s:nvim_dir . '/dein_toml.d'
"let s:note_dir     =              '~/CloudNote'

"" Dotfiles
nmap <silent> <space>de :<c-u>Defx ~/dotfiles<cr>
nmap <silent> <space>dv :<c-u>Defx -split=horizontal -winheight=30 -winheight=60 -direction=topleft ~/dotfiles<cr>
nmap <silent> <space>ds :<c-u>Defx -split=vertical   -winwidth=40 -winheight=60 -direction=topleft ~/dotfiles<cr>
nmap <silent> <space>db :<c-u>Defx -split=tab ~/dotfiles<cr>
"" Config
nmap <silent> <space>ce :<c-u>Defx ~/dotfiles/nvim<CR>
nmap <silent> <space>cv :<c-u>Defx -split=horizontal -winheight=30 -direction=topleft ~/dotfiles/nvim<CR>
nmap <silent> <space>cs :<c-u>Defx -split=vertical   -winwidth=40 -winheight=60 -direction=topleft ~/dotfiles/nvim<CR>
nmap <silent> <space>cb :<c-u>Defx -split=tab ~/dotfiles/nvim<CR>
"" Keymapping
nmap <silent> <space>ke :<c-u>Defx ~/dotfiles/keymap.d<CR>
nmap <silent> <space>kv :<c-u>Defx -split=horizontal -winheight=30 -direction=topleft ~/dotfiles/keymap.d<CR>
nmap <silent> <space>ks :<c-u>Defx -split=vertical   -winwidth=40 -winheight=60 -direction=topleft ~/dotfiles/keymap.d<CR>
nmap <silent> <space>kb :<c-u>Defx -split=tab ~/dotfiles/keymap.d<CR>
"" Plugins list: dein's toml
nmap <silent> <space>pe :<c-u>Defx ~/dotfiless/dein_toml.d<CR>
nmap <silent> <space>pv :<c-u>Defx -split=horizontal -winheight=30 -direction=topleft ~/dotfiles/dein_toml.d<CR>
nmap <silent> <space>ps :<c-u>Defx -split=vertical   -winwidth=40 -winheight=60 -direction=topleft ~/dotfiles/dein_toml.d<CR>
nmap <silent> <space>pb :<c-u>Defx -split=tab ~/dotfiles/dein_toml.d<CR>
"" Stand-by a CloudNote
nmap <space>ne :<c-u>Defx ~/CloudNote
nmap <space>nv :<c-u>Defx -split=horizontal -winheight=30 -direction=topleft ~/CloudNote
nmap <space>ns :<c-u>Defx -split=vertical   -winwidth=40 -winheight=60 -direction=topleft ~/CloudNote
nmap <space>nb :<c-u>Defx -split=tab ~/CloudNote

"" Alt-map
"nmap <silent> <a-space><a--> :<c-u>Defx `expand('%:p:h')` -search=`expand('%:p')`<cr>
""" Optional
"nmap <silent> <a-space><a-e> :<c-u>Defx 
"nmap <silent> <a-space><a-s> :<c-u>Defx -split=horizontal -winheight=60 -direction=topleft 
"nmap <silent> <a-space><a-v> :<c-u>Defx -split=vertical -winwidth=40 -direction=topleft 
"nmap <silent> <a-space><a-b> :<c-u>Defx -split=tab 
""" Home
"nmap <silent> <a-h><a-e> :<c-u>Defx ~<cr>
"nmap <silent> <a-h><a-v> :<c-u>Defx -split=vertical -winwidth=40 -direction=topleft ~<cr>
"nmap <silent> <a-h><a-s> :<c-u>Defx -split=horizontal -winheight=60 -direction=topleft ~<cr>
"nmap <silent> <a-h><a-b> :<c-u>Defx -split=tab ~<cr>
""" Current File
"nmap <silent> <a-.><a-e> :<c-u>Defx .<cr>
"nmap <silent> <a-.><a-v> :<c-u>Defx -split=vertical -winwidth=40 -direction=topleft .<cr>
"nmap <silent> <a-.><a-s> :<c-u>Defx -split=horizontal -winhieght=60 -direction=topleft .<cr>
"nmap <silent> <a-.><a-b> :<c-u>Defx -split=tab .<cr>
"
"""" Praticular Dirs.
""let s:dotfiles_dir =              '~/dotfiles'
""let s:nvim_dir     = s:dotfiles . '/nvim'
""let s:keymap_dir   = s:nvim_dir . '/keymap.d'
""let s:plugins_dir  = s:nvim_dir . '/dein_toml.d'
""let s:note_dir     =              '~/CloudNote'
"
""" Dotfiles
"nmap <silent> <a-d><a-e> :<c-u>Defx ~/dotfiles<cr>
"nmap <silent> <a-d><a-v> :<c-u>Defx -split=horizontal -winheight=30 -direction=topleft ~/dotfiles<cr>
"nmap <silent> <a-d><a-s> :<c-u>Defx -split=vertical   -winwidth=40 -direction=topleft ~/dotfiles<cr>
"nmap <silent> <a-d><a-b> :<c-u>Defx -split=tab ~/dotfiles<cr>
""" Config
"nmap <silent> <a-c><a-e> :<c-u>Defx ~/dotfiles/nvim<CR>
"nmap <silent> <a-c><a-v> :<c-u>Defx -split=horizontal -winheight=30 -direction=topleft ~/dotfiles/nvim<CR>
"nmap <silent> <a-c><a-s> :<c-u>Defx -split=vertical   -winwidth=40 -direction=topleft ~/dotfiles/nvim<CR>
"nmap <silent> <a-c><a-b> :<c-u>Defx -split=tab ~/dotfiles/nvim<CR>
""" Keymapping
"nmap <silent> <a-k><a-e> :<c-u>Defx ~/dotfiles/keymap.d<CR>
"nmap <silent> <a-k><a-v> :<c-u>Defx -split=horizontal -winheight=30 -direction=topleft ~/dotfiles/keymap.d<CR>
"nmap <silent> <a-k><a-s> :<c-u>Defx -split=vertical   -winwidth=40 -direction=topleft ~/dotfiles/keymap.d<CR>
"nmap <silent> <a-k><a-b> :<c-u>Defx -split=tab ~/dotfiles/keymap.d<CR>
""" Plugins list: dein's toml
"nmap <silent> <a-p><a-e> :<c-u>Defx ~/dotfiless/dein_toml.d<CR>
"nmap <silent> <a-p><a-v> :<c-u>Defx -split=horizontal -winheight=30 -direction=topleft ~/dotfiles/dein_toml.d<CR>
"nmap <silent> <a-p><a-s> :<c-u>Defx -split=vertical   -winwidth=40 -direction=topleft ~/dotfiles/dein_toml.d<CR>
"nmap <silent> <a-p><a-b> :<c-u>Defx -split=tab ~/dotfiles/dein_toml.d<CR>
""" Stand-by a CloudNote
"nmap <silent> <a-n><a-e> :<c-u>Defx ~/CloudNote
"nmap <silent> <a-n><a-v> :<c-u>Defx -split=horizontal -winheight=30 -direction=topleft ~/CloudNote
"nmap <silent> <a-n><a-s> :<c-u>Defx -split=vertical   -winwidth=40 -direction=topleft ~/CloudNote
"nmap <silent> <a-n><a-b> :<c-u>Defx -split=tab ~/CloudNote
"
"""" Keybinds only on Defx
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
  "" netrw-like
  nnoremap <silent><buffer><expr> -
        \ defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> <CR>
        \ defx#do_action('open')
  nnoremap <silent><buffer><expr> m
        \ defx#do_action('open')
  nnoremap <silent><buffer><expr> v
        \ defx#do_action('open', 'vsplit')
  nnoremap <silent><buffer><expr> o
        \ defx#do_action('open', 'split')
  nnoremap <silent><buffer><expr> p
        \ defx#do_action('open', 'pedit')
  nnoremap <silent><buffer><expr> u
        \ defx#do_action('open_or_close_tree')
	  nnoremap <silent><buffer><expr> <s-m>
        \ defx#do_action('drop')

 """ File-Management
  " Clipboard
  " show the path under cursor on status-bar.
  nnoremap <buffer><expr> mc
        \ defx#do_action('copy')
  nnoremap <buffer><expr> mm
        \ defx#do_action('move')
  nnoremap <buffer><expr> mp
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
