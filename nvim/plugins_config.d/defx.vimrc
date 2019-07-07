"" TODO: show sym-links.
"""" Config
" when buffer-name is '_', the options are used fpr all buffers.
call defx#custom#option('_',{
 \ 'show_ignored_files': 0,
 \ })

call defx#custom#column('filename', {
      \ 'min_width': 40,
      \ 'max_width': 40,
      \ })

call defx#custom#column('mark', {
      \ 'readonly_icon': '✗',
      \ 'selected_icon': '✓',
      \ })

let g:defx_git#indicators = {
      \ 'Modified'  : '+',
      \ 'Staged'    : '●',
      \ 'Untracked' : '?',
      \ 'Renamed'   : '➜',
      \ 'Unmerged'  : '═',
      \ 'Deleted'   : 'x',
      \ 'Unknown'   : '?'
      \ }

"""" Keymap
""" Open Preceding Tree
nmap <silent> <space>- :<c-u>Defx `expand('%:p:h')` -search=`expand('%:p')`<cr>
nmap <silent> <space>v :<c-u>Defx `expand('%:p:h')` -search=`expand('%:p')` -split=vertical -winwidth=35 -winheight=60 -direction=topleft <cr>
nmap <silent> <space>b :<c-u>Defx `expand('%:p:h')` -search=`expand('%:p')` -split=tab<cr>

augroup myDefx
  autocmd!
  autocmd FileType defx call s:defx_my_settings()
  autocmd FileType defx call s:defx_my_shortcut()
augroup END

"""" shortcut
function! s:defx_my_shortcut() abort
  
  """ Paticular Dirs
  "" Optional
  nmap <buffer>         <space>e :<c-u>Defx 
  "" Current File
  nmap <buffer><silent> <space>. :<c-u>Defx .<cr>

  "" Dotfiles
  nmap <buffer><silent> <space>d :<c-u>Defx ~/dotfiles<cr>
  "" Stand-by a CloudNote
  nmap <buffer>         <space>n :<c-u>Defx ~/CloudNote/

  "" VimConfig
  nmap <buffer><silent> <space>c :<c-u>Defx ~/dotfiles/nvim/<cr>
  nmap <buffer><silent> <space>t :<c-u>Defx ~/dotfiles/nvim/dein_toml.d/<cr>
  nmap <buffer><silent> <space>p :<c-u>Defx ~/dotfiles/nvim/plugins_config.d/<cr>

  "" Help txt
  nmap <buffer><silent> <space>h :<c-u>Defx ~/.cache/nvim/dein/.cache/init.vim/.dein/doc<cr>

endfunction

"""" Keybinds only on Defx

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
